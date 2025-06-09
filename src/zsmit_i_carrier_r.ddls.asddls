@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read-Only E2E: Data Model Carrier'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZSMIT_I_Carrier_R
  as select from /dmo/carrier as Airline
{
  key Airline.carrier_id            as AirlineId,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Airline.name                  as Name,
      Airline.currency_code         as CurrencyCode,
      Airline.local_created_by      as LocalCreatedBy,
      Airline.local_created_at      as LocalCreatedAt,
      Airline.local_last_changed_by as LocalLastChangedBy,
      Airline.local_last_changed_at as LocalLastChangedAt,
      Airline.last_changed_at       as LastChangedAt
}
