@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read-Only E2E: Data Model Airport'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZSMIT_I__Airport
  as select from /dmo/airport as Airport
{
  key Airport.airport_id as AirportId,
      Airport.name       as Name,
      Airport.city       as City,
      Airport.country    as CountryCode
}
