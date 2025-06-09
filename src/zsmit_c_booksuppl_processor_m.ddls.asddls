@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement Projection View'
@Metadata.ignorePropagatedAnnotations: true
@UI: { headerInfo: { typeName:       'Booking Supplement',
                     typeNamePlural: 'Booking Supplements',
                     title:          { type: #STANDARD,
                                       label: 'Booking Supplement',
                                       value: 'BookingSupplementID' } } }
@Search.searchable: true

define view entity ZSMIT_C_BookSuppl_Processor_M
  as projection on zsmit_I_BookSuppl_M
{
      @UI.facet: [ { id:              'BookingSupplement',
                         purpose:         #STANDARD,
                         type:            #IDENTIFICATION_REFERENCE,
                         label:           'Booking Supplement',
                         position:        10 }  ]

      @Search.defaultSearchElement: true
  key travel_id                   as TravelID,

      @Search.defaultSearchElement: true
  key booking_id                  as BookingID,

      @UI: { lineItem:       [ { position: 10, importance: #HIGH } ],
             identification: [ { position: 10 } ] }
  key booking_supplement_id       as BookingSupplementID,

      @UI: { lineItem:       [ { position: 20, importance: #HIGH } ],
             identification: [ { position: 20 } ] }
      @Consumption.valueHelpDefinition: [
          {  entity: {name: '/DMO/I_Supplement_StdVH', element: 'SupplementID' },
             additionalBinding: [ { localElement: 'Price',        element: 'Price',        usage: #RESULT },
                                  { localElement: 'CurrencyCode', element: 'CurrencyCode', usage: #RESULT }],
             useForValidation: true }
        ]
      @ObjectModel.text.element: ['SupplementDescription']
      supplement_id               as SupplementID,
      _SupplementText.Description as SupplementDescription : localized,

      @UI: { lineItem:       [ { position: 30, importance: #HIGH } ],
             identification: [ { position: 30 } ] }
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                       as Price,

      @Consumption.valueHelpDefinition: [{entity: {name: 'I_CurrencyStdVH', element: 'Currency' }, useForValidation: true }]
      currency_code               as CurrencyCode,

      @UI.hidden: true
      last_changed_at             as LastChangedAt,

      /* Associations */
      _Travel  : redirected to ZSMIT_C_Travel_Processor_M,
      _Booking : redirected to parent ZSMIT_C_Booking_Processor_M,
      _Product

}
