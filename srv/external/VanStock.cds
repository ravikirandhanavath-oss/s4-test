/* checksum : 0ee73515217cd21ed80c5b0edc68213b */
@cds.external : true
@CodeList.CurrencyCodes.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.CurrencyCodes.CollectionPath : 'Currencies'
@CodeList.UnitsOfMeasure.Url : '../../../../default/iwbep/common/0001/$metadata'
@CodeList.UnitsOfMeasure.CollectionPath : 'UnitsOfMeasure'
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
service VanStock {
  @cds.external : true
  @cds.persistence.skip : true
  @Common.Label : 'PO History Aggregated'
  @Aggregation.ApplySupported.Transformations : [ 'aggregate' ]
  @Aggregation.CustomAggregate#TotalQuantity : 'Edm.Decimal'
  @Capabilities.SearchRestrictions.Searchable : false
  @Capabilities.InsertRestrictions.Insertable : false
  @Capabilities.DeleteRestrictions.Deletable : false
  @Capabilities.UpdateRestrictions.Updatable : false
  @Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
  @Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
    {
      Property: PurOrdAmountInCompanyCodeCrcy,
      AllowedExpressions: 'MultiValue'
    },
    { Property: TotalQuantity, AllowedExpressions: 'MultiValue' }
  ]
  entity VanStockProfileList {
    @Common.IsUpperCase : true
    @Common.Label : 'Purchase Order'
    @Common.Heading : 'Purchase Order Number'
    @Common.QuickInfo : 'Purchase Order Number'
    key PurchaseOrder : String(10) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Purchasing Doc. Type'
    @Common.Heading : 'Type'
    @Common.QuickInfo : 'Purchasing Document Type'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ESART'
    key PurchaseOrderType : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Status'
    @Common.Heading : 'S'
    @Common.QuickInfo : 'Status of Purchasing Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=ESTAK'
    key PurchasingDocumentOrigin : String(1) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Movement Type'
    @Common.Heading : 'MvT'
    @Common.QuickInfo : 'Movement Type (Inventory Management)'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BWART'
    key GoodsMovementType : String(3) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Material'
    @Common.QuickInfo : 'Material Number'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MATNR'
    key Material : String(18) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Material Doc. Year'
    @Common.Heading : 'MatYr'
    @Common.QuickInfo : 'Material Document Year'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MJAHR'
    key PurchasingHistoryDocumentYear : String(4) not null;
    @Common.IsUpperCase : true
    @Common.Label : 'Material Document'
    @Common.Heading : 'Mat. Doc.'
    @Common.QuickInfo : 'Number of Material Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MBLNR'
    key PurchasingHistoryDocument : String(10) not null;
    @Common.IsDigitSequence : true
    @Common.Label : 'Material Doc.Item'
    @Common.Heading : 'Item'
    @Common.QuickInfo : 'Item in Material Document'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=MBLPO'
    key PurchasingHistoryDocumentItem : String(4) not null;
    @Measures.ISOCurrency : Currency
    @Common.Label : 'Amt.in Loc.Cur.'
    @Common.QuickInfo : 'Amount in Local Currency'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=DMBTR_CS'
    PurOrdAmountInCompanyCodeCrcy : Decimal(precision: 13) not null;
    @Common.IsCurrency : true
    @Common.IsUpperCase : true
    @Common.Label : 'Currency'
    @Common.Heading : 'Crcy'
    @Common.QuickInfo : 'Currency Key'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=WAERS'
    Currency : String(5) not null;
    @Measures.Unit : BaseUnit
    TotalQuantity : Decimal(13, 3) not null;
    @Common.IsUnit : true
    @Common.Label : 'Order Unit'
    @Common.Heading : 'OUn'
    @Common.QuickInfo : 'Purchase Order Unit of Measure'
    @Common.DocumentationRef : 'urn:sap-com:documentation:key?=type=DE&id=BSTME'
    BaseUnit : String(3) not null;
  };
};

