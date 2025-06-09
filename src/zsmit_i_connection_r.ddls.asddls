@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection View - CDS Data Model'
@UI.headerInfo:{typeName: 'Connection',
                typeNamePlural: 'Connections'}
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED    
}
@Search.searchable: true
define view entity ZSMIT_I_CONNECTION_R
  as select from /dmo/connection as connection
  association [1..*] to ZSMIT_I_FLIGHT_R as _Flight on $projection.AirlineId = _Flight.AirlineId
                                                   and $projection.ConnectionId = _Flight.ConnectionId
  association [1] to ZSMIT_I_Carrier_R as _Airline on  $projection.AirlineId = _Airline.AirlineId                                               
{
      @UI: {lineItem: [{position: 10, label: 'Airline' }], 
            identification: [{position: 10, label: 'Airline'}] }
      @EndUserText.quickInfo: 'Airline that operates the flight.'  
      @ObjectModel.text.association: '_Airline'  
      @Search.defaultSearchElement: true  
  key connection.carrier_id      as AirlineId,
      @UI.lineItem: [{position: 20 }]
  key connection.connection_id   as ConnectionId,
      @UI.lineItem: [{position: 30 }]
      @Consumption.valueHelpDefinition: [{  entity: {   name: 'ZSMIT_I__Airport',
                                            element:    'AirportId' } }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7                                      
      connection.airport_from_id as DepartureAirport,
      @UI.lineItem: [{position: 40 }]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7 
      @Consumption.valueHelpDefinition: [{  entity: {   name: 'ZSMIT_I__Airport' ,
                                            element:      'AirportId' } }]                
      connection.airport_to_id   as DestinationAirport,
      @UI.lineItem: [{position: 50 }]
      
      connection.departure_time  as DepartureTime,
      @UI.lineItem: [{position: 60 }]
      connection.arrival_time    as ArrivalTime,
      @UI.lineItem: [{position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      connection.distance        as Distance,
      @UI.lineItem: [{position: 80 }]
      connection.distance_unit   as DistanceUnit,

/*Associations*/
    _Flight,
    _Airline
}
