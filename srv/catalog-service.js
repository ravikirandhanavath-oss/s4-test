const cds = require('@sap/cds');
const LOG = '[S/4]';

module.exports = class CatalogService extends cds.ApplicationService {
    async init() {
        const vanStock = await cds.connect.to('VanStock');
        const productInfo = await cds.connect.to('ProductInformation');

        // pass every read of the S/4 entities on to S/4
        this.on('READ', 'VanStockProfileList', (req) => callS4(req, vanStock));
        this.on('READ', 'MaterialProfitCenter', (req) => callS4(req, productInfo));

        return super.init();
    }
};

// What each S/4 status means, in plain words
const HINTS = {
    401: 'LOGON FAILED - S/4 rejected the user from the destination',
    403: 'NO AUTHORIZATION - logon OK, but the user has no role for this service',
    404: 'NOT FOUND - wrong service path, or service not active in S/4',
    502: 'GATEWAY ERROR - Cloud Connector / connectivity problem',
    503: 'UNAVAILABLE - S/4 or Cloud Connector not reachable'
};

async function callS4(req, s4) {
    await logDestinationOnce(s4);
    const sWhat = `${s4.name}/${req.target.name.split('.').pop()}`;
    const t0 = Date.now();
    console.log(`${LOG} ${sWhat}: calling S/4 ...`);
    try {
        const result = await s4.run(req.query);
        const iRows = Array.isArray(result) ? result.length : (result ? 1 : 0);
        console.log(`${LOG} ${sWhat}: SUCCESS - ${iRows} rows in ${Date.now() - t0} ms`);
        return result;
    } catch (e) {
        const oResp = e.reason?.response;
        const oHead = oResp?.headers || {};
        const iStatus = oResp?.status || e.statusCode || '';
        const sHint = HINTS[iStatus] || '';
        console.error(`${LOG} ${sWhat}: FAILED ${iStatus} after ${Date.now() - t0} ms - ${sHint || e.message}`);
        const sUrl = e.reason?.request?.url || e.reason?.config?.url;
        if (sUrl) console.error(`${LOG} ${sWhat}: url ${String(sUrl).split('?')[0]}`);
        if (oResp) {
            console.error(`${LOG} ${sWhat}: S/4 answer: sap-system=${oHead['sap-system'] || '-'} sap-authenticated=${oHead['sap-authenticated'] || '-'} www-authenticate=${oHead['www-authenticate'] || '-'}`);
        } else {
            console.error(`${LOG} ${sWhat}: no answer from S/4: ${e.message}`);
        }
        return req.error(502, `S/4 call failed ${iStatus} ${sHint}`.trim());
    }
}

// Logs once per service which destination, user and route are used (never the password)
const logged = new Set();
async function logDestinationOnce(s4) {
    if (logged.has(s4.name)) return;
    logged.add(s4.name);
    const oCred = cds.env.requires[s4.name]?.credentials || {};
    if (!oCred.destination) {
        console.log(`${LOG} ${s4.name}: no destination configured - using ${oCred.url || 'local mock data'}`);
        return;
    }
    try {
        const { getDestination } = require('@sap-cloud-sdk/connectivity');
        const d = await getDestination({ destinationName: oCred.destination });
        if (!d) {
            console.error(`${LOG} ${s4.name}: destination '${oCred.destination}' NOT FOUND`);
            return;
        }
        console.log(`${LOG} ${s4.name}: destination=${d.name} url=${d.url} path=${oCred.path || '-'}`);
        console.log(`${LOG} ${s4.name}: proxy=${d.proxyType || '-'} location=${d.cloudConnectorLocationId || '-'} auth=${d.authentication || '-'} user=${d.username || '-'} password=${d.password ? 'set' : 'EMPTY'} sap-client=${d.sapClient || '-'}`);
    } catch (e) {
        console.error(`${LOG} ${s4.name}: could not read destination '${oCred.destination}': ${e.message}`);
    }
}