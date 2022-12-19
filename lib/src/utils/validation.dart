import 'package:credit_card_flutterme/src/utils/nums.dart';

String cardIcon({required CardType type}) {
  switch (type) {
    case CardType.amex:
      return "images/cards/amex.png";
    case CardType.chip:
      return "images/cards/chip.png";
    case CardType.diners:
      return "images/cards/diners.png";
    case CardType.discover:
      return "images/cards/discover.png";
    case CardType.elo:
      return "images/cards/elo.png";
    case CardType.hipercard:
      return "images/cards/hipercard.png";
    case CardType.jcb:
      return "images/cards/jcb.png";
    case CardType.maestro:
      return "images/cards/maestro.png";
    case CardType.mastercard:
      return "images/cards/mastercard.png";
    case CardType.mir:
      return "images/cards/mir.png";
    case CardType.unionpay:
      return "images/cards/unionpay.png";
    case CardType.visa:
      return "images/cards/visa.png";
  }
}

String maskCardNumber({required String number, required MaskType maskType}) {
  // getting mask type condition added by the developer
  bool full = maskType == MaskType.full;
  bool first4Last4 = maskType == MaskType.first4Last4;
  bool first6last2 = maskType == MaskType.first6last2;
  bool first2last6 = maskType == MaskType.first2last6;
  bool none = maskType == MaskType.none;
  String mask = "0000 0000 0000 0000"; // default
  var bufferString = StringBuffer();

  if (number.length > 2) {
    if (full) {
      mask = "*" * number.length;
    } else if (first4Last4) {
      String first4 = number.substring(0, 4);
      String last4 = number.substring(number.length - 4);
      String maskCount = "*" * (number.length - 8);
      mask = "$first4$maskCount$last4";
    } else if (first6last2) {
      String first6 = number.substring(0, 6);
      String last2 = number.substring(number.length - 2);
      String maskCount = "*" * (number.length - 8);
      mask = "$first6$maskCount$last2";
    } else if (first2last6) {
      String first2 = number.substring(0, 2);
      String last6 = number.substring(number.length - 6);
      String maskCount = "*" * (number.length - 8);
      mask = "$first2$maskCount$last6";
    } else if (none) {
      mask = number;
    }
  }

  for (int i = 0; i < mask.length; i++) {
    bufferString.write(mask[i]);
    var nonZeroIndexValue = i + 1;
    if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != mask.length) {
      bufferString.write(" ");
    }
  }

  return bufferString.toString();
}
