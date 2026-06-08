@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View on Booking Supplement'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zaka_c_booksuppl
  as projection on zaka_I_booksuppl
{
  key TravelId,
  key BookingId,
  key BookSupplId,
      @ObjectModel.text.element: [ 'supplementName' ]
      SupplementId,
      _SupplementText.Description as supplementName : localized, 
      @Semantics.amount.currencyCode : 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Booking : redirected to parent zaka_c_booking,
      _Supplement,
      _SupplementText,
      _Travel : redirected to zaka_c_travel
}
