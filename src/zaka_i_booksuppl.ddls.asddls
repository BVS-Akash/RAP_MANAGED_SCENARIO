@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
define view entity zaka_I_booksuppl
  as select from zakabooksuppl

  association        to parent zaka_i_booking as _Booking        on  $projection.TravelId  = _Booking.TravelId
                                                                 and $projection.BookingId = _Booking.BookingId
  association [1..1] to zaka_i_travel         as _Travel         on  $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Supplement     as _Supplement     on  $projection.SupplementId = _Supplement.SupplementID
  association [1..*] to /DMO/I_SupplementText as _SupplementText on  $projection.SupplementId = _SupplementText.SupplementID
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
  key book_suppl_id   as BookSupplId,
      supplement_id   as SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price           as Price,
      currency_code   as CurrencyCode,
      last_changed_at as LastChangedAt,

      // -> Associations
      _Booking,
      _Supplement,
      _SupplementText,
      _Travel

}
