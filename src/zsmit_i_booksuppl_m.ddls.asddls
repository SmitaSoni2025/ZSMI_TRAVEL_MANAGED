@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement View - CDS data model'

define view entity zsmit_I_BookSuppl_M
  as select from zsmit_booksupl_m as BookingSuppliment
  association        to parent zsmit_I_BOOKING_M as _Booking        on  $projection.travel_id  = _Booking.travel_id
                                                                    and $projection.booking_id = _Booking.booking_id
                                                                    
  association [1..1] to ZSMIT_I_Travel_M         as _Travel         on  $projection.travel_id = _Travel.travel_id
  association [1..1] to /DMO/I_Supplement        as _Product        on  $projection.supplement_id = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText    as _SupplementText on  $projection.supplement_id = _SupplementText.SupplementID
{
  key travel_id,
  key booking_id,
  key booking_supplement_id,
      supplement_id,
      @Semantics.amount.currencyCode: 'currency_code'
      price,
      currency_code,
      //Local Etag Field --> Odata Etag
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      last_changed_at,

      /*Association */
      _Booking,
      _Travel,
      _Product,
      _SupplementText

}
