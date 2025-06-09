@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for available flights'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZSMIT_I_FLIGHT_R
  as select from /dmo/flight as flight
  association [1] to ZSMIT_I_Carrier_R as _Airline on $projection.AirlineId = _Airline.AirlineId
{
      @UI.lineItem: [ {position: 10, label: 'Airline'  } ]
      @ObjectModel.text.association: '_Airline'
  key flight.carrier_id     as AirlineId,
      @UI.lineItem: [ { position: 20, label: 'Connection Number' } ]
  key flight.connection_id  as ConnectionId,
      @UI.lineItem: [ { position: 30, label: 'Flight Date' } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
  key flight.flight_date    as FlightDate,
      @UI.lineItem: [ { position: 40, label: 'Price' } ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight.price          as Price,
      flight.currency_code  as CurrencyCode,
      @UI.lineItem: [ { position: 50, label: 'Plane Type' } ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      flight.plane_type_id  as PlaneTypeId,
      @UI.lineItem: [ { position: 60, label: 'Maximum Seats' } ]
      flight.seats_max      as MaximumSeats,
      @UI.lineItem: [ { position: 70, label: 'Occupied Seats' } ]
      flight.seats_occupied as OccupiedSeats,

      /*Association*/
      _Airline

}
