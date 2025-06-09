@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel view - CDS data model'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZSMIT_I_Travel_M
  as select from zsmit_travel_m as Travel

  composition [0..*] of zsmit_I_BOOKING_M        as _Booking

  association [0..1] to /DMO/I_Agency            as _Agency        on $projection.agency_id = _Agency.AgencyID
  association [0..1] to /DMO/I_Customer          as _Customer      on $projection.customer_id = _Customer.CustomerID
  association [0..1] to I_Currency               as _Currency      on $projection.currency_code = _Currency.Currency
  association [0..1] to /DMO/I_Overall_Status_VH as _OverallStatus on $projection.overall_status = _OverallStatus.OverallStatus
{

      @UI.facet: [{ id: 'Travel' , purpose: #STANDARD, type: #IDENTIFICATION_REFERENCE, label: 'Travel', position: 10  }]
      @UI.lineItem: [ { position: 10, label: 'Travel ID' },
         { type: #FOR_ACTION, dataAction: 'copyTravel', label: 'copyTravel', position: 10 },
         { type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'acceptTravel', position:20 },
         { type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'rejectTravel', position:30 }
         ]
      @UI.identification: [{ position: 10 , label : 'Travel ID' }, 
                           { type: #FOR_ACTION, dataAction: 'copyTravel', label: 'copyTravel', position: 10 },
                           { type: #FOR_ACTION, dataAction: 'acceptTravel', label: 'acceptTravel', position:20 },
                           { type: #FOR_ACTION, dataAction: 'rejectTravel', label: 'rejectTravel', position:30 }]
  key travel_id,
      @UI.lineItem: [ { position: 20, label: 'Agency ID' } ]
      @UI.identification: [{ position: 20 , label : 'Agency ID' }]
      agency_id,
      @UI.lineItem: [ { position: 30, label: 'Customer ID' } ]
      @UI.identification: [{ position: 30 , label : 'Customer ID' }]
      customer_id,
      @UI.lineItem: [ { position: 40, label: 'Begin Date' } ]
      @UI.identification: [{ position: 40 , label : 'Begin Date' }]
      begin_date,
      @UI.lineItem: [ { position: 50, label: 'End Date' } ]
      @UI.identification: [{ position: 50 , label : 'End Date' }]
      end_date,
      @UI.lineItem: [ { position: 60, label: 'booking_fee' } ]
      @UI.identification: [{ position: 60 , label : 'booking_fee' }]
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      @UI.lineItem: [ { position: 70, label: 'Total Price' } ]
      @UI.identification: [{ position: 70 , label : 'Total Price' }]
      total_price,
      @UI.lineItem: [ { position: 80, label: 'Currency Code' } ]
      @UI.identification: [{ position: 80 , label : 'Currency Code' }]
      currency_code,
      @UI.lineItem: [ { position: 90, label: 'description' } ]
      @UI.identification: [{ position: 90 , label : 'description' }]
      description,
      @UI.lineItem: [ { position: 100, label: 'Overall Status' } ]
      @UI.identification: [{ position: 100 , label : 'Overall Status' }]
      overall_status,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by,
      //Local Etag Field --> Odata Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,


      /*Association*/
      _Booking,
      _Agency,
      _Customer,
      _Currency,
      _OverallStatus

}
