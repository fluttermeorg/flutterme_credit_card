/// #### Card Type
/// used in the selection of card type during the card validation stage.
/// This have all the type of supported cards in a `enum`.
///
/// ##### List of supported cards
/// <div align="center">
/// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/support_cards.png" width="50%">
/// </div>
enum CardType {
  amex,
  chip,
  diners,
  discover,
  elo,
  hipercard,
  jcb,
  maestro,
  mastercard,
  mir,
  unionpay,
  visa,
}

enum MaskType {
  full,
  first4Last4,
  first6last2,
  first2last6,
  none,
}
