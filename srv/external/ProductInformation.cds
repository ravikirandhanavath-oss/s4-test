/* checksum : f56b8370ae0a9d6b3052a80584644ec3 */
@cds.external : true
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.HeaderFooter : true
@PDF.Features.IANATimezoneFormat : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@PDF.Features.Signature : true
@PDF.Features.TextDirectionLayout : true
@PDF.Features.Treeview : true
@PDF.Features.UploadToFileShare : true
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service ProductInformation {
  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'Material - Material Group - Profit Center'
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  entity MaterialProfitCenter {
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_product/0001;ps=''srvd-zmm_material_profitctr_sd-0001'';va=''com.sap.gateway.srvd.zmm_material_profitctr_sd.v0001.et-zmm_material_profitcenter.product''/$metadata'
    ]
    @Common.Label : 'Product'
    @Common.QuickInfo : 'Product Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRODUCTNUMBER'
    key Product : String(18) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Plant'
    @Common.Heading : 'Plnt'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WERKS_D'
    key Plant : String(4) not null;
    @Common.SAPObjectNodeTypeReference : 'ProductGroup'
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_productgroup/0001;ps=''srvd-zmm_material_profitctr_sd-0001'';va=''com.sap.gateway.srvd.zmm_material_profitctr_sd.v0001.et-zmm_material_profitcenter.materialgroup''/$metadata'
    ]
    @Common.Label : 'Product Group'
    @Common.Heading : 'Prd Group'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRODUCTGROUP'
    MaterialGroup : String(9) not null;
    @Common.IsUpperCase : true
    @Common.ValueListReferences : [
      '../../../../srvd_f4/sap/i_profitcenter/0001;ps=''srvd-zmm_material_profitctr_sd-0001'';va=''com.sap.gateway.srvd.zmm_material_profitctr_sd.v0001.et-zmm_material_profitcenter.profitcenter''/$metadata'
    ]
    @Common.Label : 'Profit Center'
    @Common.Heading : 'Profit Ctr'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRCTR'
    ProfitCenter : String(10) not null;
    @Common.SAPObjectNodeTypeReference : 'ProductType'
    @Common.IsUpperCase : true
    @Common.Label : 'Product Type'
    @Common.Heading : 'PTyp'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=PRODUCTTYPE'
    ProductType : String(4) not null;
  };
};

