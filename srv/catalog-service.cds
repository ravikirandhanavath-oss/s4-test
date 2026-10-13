// Two namespaces in srv:
//   s4test             - our own test table (db/schema.cds)
//   VanStock /
//   ProductInformation - the S/4 services imported from the EDMX files
using { s4test } from '../db/schema';
using { VanStock } from './external/VanStock';
using { ProductInformation } from './external/ProductInformation';

@requires: 'authenticated-user'
service CatalogService {

    // own data from HANA
    entity TestEntries as projection on s4test.TestEntries;

    // live S/4 data via destination SCB_VanStock_400 (read-only, not stored in HANA)
    @readonly @cds.persistence.skip
    entity VanStockProfileList as projection on VanStock.VanStockProfileList;

    @readonly @cds.persistence.skip
    entity MaterialProfitCenter as projection on ProductInformation.MaterialProfitCenter;
}
