@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel Projrction View'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true

@UI: {headerInfo:{typeName: 'Travel', 
                  typeNamePlural: 'Travels',
                  title: { type: #STANDARD, value: 'TravelID' }
                  }
      }
define root view entity ZSMIT_C_Travel_Processor_M 
provider contract transactional_query
as projection on ZSMIT_I_Travel_M
{
    @UI.facet: [ { id:              'Travel',
                     purpose:         #STANDARD,
                     type:            #IDENTIFICATION_REFERENCE,
                     label:           'Travel',
                     position:        10 },
                   { id:              'Booking',
                     purpose:         #STANDARD,
                     type:            #LINEITEM_REFERENCE,
                     label:           'Booking',
                     position:        20,
                     targetElement:   '_Booking'}]


      @UI: {
          lineItem:       [ { position: 10, importance: #HIGH } ,
                          { type: #FOR_ACTION, dataAction: 'copyTravel', label: 'Copy Travel' } ],
          identification: [ { position: 10, label: 'Travel ID' } ] }
      
      @Search.defaultSearchElement: true
  key travel_id          as TravelID,

      @UI: {
          lineItem:       [ { position: 20, importance: #HIGH } ],
          identification: [ { position: 20 } ],
          selectionField: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [{ entity : {name: '/DMO/I_Agency_StdVH', element: 'AgencyID'  }, useForValidation: true }]
      @ObjectModel.text.element: ['AgencyName']
      @Search.defaultSearchElement: true
      agency_id          as AgencyID,
      _Agency.Name       as AgencyName,

      @UI: {
          lineItem:       [ { position: 30, importance: #HIGH } ],
          identification: [ { position: 30 } ],
          selectionField: [ { position: 30 } ] }
      @Consumption.valueHelpDefinition: [{entity: {name: '/DMO/I_Customer_StdVH', element: 'CustomerID' }, useForValidation: true}]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      customer_id        as CustomerID,
      _Customer.LastName as CustomerName,

      @UI: {
          lineItem:       [ { position: 40, importance: #MEDIUM } ],
          identification: [ { position: 40 } ] }
      begin_date         as BeginDate,

      @UI: {
          lineItem:       [ { position: 41, importance: #MEDIUM } ],
          identification: [ { position: 41 } ] }
      end_date           as EndDate,


      @UI: {
          identification: [ { position: 42 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      booking_fee        as BookingFee,

      @UI: {
          lineItem:       [ { position: 43, importance: #MEDIUM } ],
          identification: [ { position: 43, label: 'Total Price' } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      total_price        as TotalPrice,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      currency_code      as CurrencyCode,

      @UI: {
          lineItem:       [ { position: 50, importance: #HIGH } ],
          identification: [ { position: 45, label: 'Status' } ],
          selectionField: [{ position: 40 }],
          textArrangement: #TEXT_ONLY
           }
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Overall_Status_VH', element: 'OverallStatus' }}]
      @ObjectModel.text.element: ['OverallStatusText']    
      overall_status     as OverallStatus,
      
      @UI.hidden: true
      _OverallStatus._Text.Text as OverallStatusText : localized,

      @UI: {
          identification:[ { position: 46 } ]  }
      description        as Description,

      @UI.hidden: true
      last_changed_at    as LastChangedAt,

      /* Associations */
      _Booking : redirected to composition child ZSMIT_C_Booking_Processor_M,
      _Agency,
      _Customer,
      _OverallStatus

}
