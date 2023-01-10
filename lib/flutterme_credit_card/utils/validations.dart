import 'package:flutter/services.dart';
import 'package:flutterme_credit_card/flutterme_credit_card/utils/constants.dart';

/// ## Range
/// ### **Type:** `num`
/// It's an extension for all int manipulations
extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}

/// ## Detect Card Type
/// ### **Type:** `FMCardType`
/// Check the card number given and produce the accurate card type
/// using the card patterns in [numberPattern]. If no such card,
/// it returns a chip type.
FMCardType detectCardType({required String number}) {
  // setting a default card type
  FMCardType cardType = FMCardType.chip;

  // checking for white space
  number = number.replaceAll(RegExp(r'\s+\b|\b\s'), "");

  // checking if number is empty
  if (number.isEmpty) return cardType;

  // checking if number contain only numerics
  if (RegExp(r'\D+').hasMatch(number)) return cardType;

  numberPattern.forEach(
    (FMCardType type, Set<List<String>> patterns) {
      for (List<String> pattern in patterns) {
        // creating inner card number variable storage
        String newNumber = number;

        // getting the pattern length
        int patternLength = pattern[0].length;

        // make the card number length match the pattern length
        if (patternLength < number.length) {
          newNumber = newNumber.substring(0, patternLength);
        }

        // some patterns contain a length less than zero. To avoid
        // [Out Of Range] error we will have to handle them separately
        // within the else statement.
        if (pattern.length > 1) {
          // making parser to int for manipulation
          int numberAsInt = int.parse(newNumber);
          int startPattern = int.parse(pattern[0]);
          int endPattern = int.parse(pattern[1]);

          // checking if number contains ending pattern or not
          if (numberAsInt >= startPattern && numberAsInt <= endPattern) {
            cardType = type;
            break;
          }
        } else {
          if (newNumber == pattern[0]) {
            cardType = type;
            break;
          }
        }
      }
    },
  );

  // finally return the card type
  return cardType;
}

/// ## Card Icon
/// ### **Type:** `String`
/// This takes the card number, and uses the [detectCardType] function to
/// to check the card type and returns an assets [URL] for the card company
/// image [Card Icon]
String cardIcon({required String number}) {
  switch (detectCardType(number: number)) {
    case FMCardType.amex:
      return "images/amex.png"; // American Express
    case FMCardType.chip:
      return "images/chip.png"; // Chip
    case FMCardType.diners:
      return "images/diners.png"; // Diners
    case FMCardType.discover:
      return "images/discover.png"; // Discover
    case FMCardType.elo:
      return "images/elo.png"; // Elo
    case FMCardType.hipercard:
      return "images/hipercard.png"; // Hipercard
    case FMCardType.jcb:
      return "images/jcb.png"; // JCB
    case FMCardType.maestro:
      return "images/maestro.png"; // Maestro
    case FMCardType.mastercard:
      return "images/mastercard.png"; // Mastercard
    case FMCardType.mir:
      return "images/mir.png"; // Mir
    case FMCardType.unionpay:
      return "images/unionpay.png"; // Unionpay
    case FMCardType.visa:
      return "images/visa.png"; // Visa
  }
}

/// ## Mask Card Number
/// ### **Type:** `String`
/// Use in the masking process of card number. It requires the card number
/// and mask type and uses these two params to mask the card number.
String maskCardNumber({required String number, required FMMaskType maskType}) {
  // getting mask type condition added by the developer
  bool full = maskType == FMMaskType.full;
  bool first4Last4 = maskType == FMMaskType.first4Last4;
  bool first6last2 = maskType == FMMaskType.first6last2;
  bool first2last6 = maskType == FMMaskType.first2last6;
  bool none = maskType == FMMaskType.none;
  String mask = "0000 0000 0000 0000";
  var bufferString = StringBuffer();

  // return the number input without validation to avoid length error
  if (number.length < 8) return number;

  // remove the "/" from number passed buffer
  number = number.replaceAll(" ", "");

  // card number length less than two are not validated to avoid [Out Of Range].
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

  // this is to buff the number using space after every 4 characters
  for (int i = 0; i < mask.length; i++) {
    bufferString.write(mask[i]);
    var nonZeroIndexValue = i + 1;
    if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != mask.length) {
      bufferString.write(" ");
    }
  }

  // finally return the buffed number
  return bufferString.toString();
}

/// ## Mask Valid Thru
/// ### **Type:** `String`
/// Use in the masking process of valid thru. It requires the card valid thru
/// and mask type and uses these two params to mask the card valid thru.
String maskValidThru({
  required String validThru,
  required FMMaskType maskType,
}) {
  // getting mask type condition added by the developer
  bool full = maskType == FMMaskType.full;
  bool none = maskType == FMMaskType.none;
  String mask = "0000";
  var bufferString = StringBuffer();

  // return the valid thru input without validation to avoid length error
  if (validThru.length != 5) return validThru;

  // remove the "/" from valid thru passed buffer
  validThru = validThru.replaceAll("/", "");

  if (full) {
    mask = "*" * validThru.length;
  } else if (none) {
    mask = validThru;
  }

  // this is to buff the valid thru using / after first 2 characters
  for (int i = 0; i < mask.length; i++) {
    bufferString.write(mask[i]);
    var nonZeroIndexValue = i + 1;
    if (nonZeroIndexValue % 2 == 0 && nonZeroIndexValue != mask.length) {
      bufferString.write("/");
    }
  }

  // finally return the buffed valid thru
  return bufferString.toString();
}

/// ## Mask CVV
/// ### **Type:** `String`
/// Use in the masking process of CVV. It requires the card CVV
/// and mask type and uses these two params to mask the card CVV.
String maskCVV({required String cvv, required FMMaskType maskType}) {
  // getting mask type condition added by the developer
  bool full = maskType == FMMaskType.full;
  bool none = maskType == FMMaskType.none;
  String mask = "000";

  // return the cvv input without validation to avoid length error
  if (cvv.length >= 5) return cvv;

  // checking if cvv is valid

  if (full) {
    mask = "*" * cvv.length;
  } else if (none) {
    mask = cvv;
  }

  // finally return the masked cvv
  return mask;
}

// Card Number text input formatter
class NumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    var input = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    // this is to buff the valid thru using / after first 2 characters
    for (int i = 0; i < input.length; i++) {
      bufferString.write(input[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != input.length) {
        bufferString.write(" ");
      }
    }

    // finally return the buffed valid thru
    var string = bufferString.toString();

    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

// Valid Thur text input formatter
class ValidThurFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    var input = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    // this is to buff the valid thru using / after first 2 characters
    for (int i = 0; i < input.length; i++) {
      bufferString.write(input[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 2 == 0 && nonZeroIndexValue != input.length) {
        bufferString.write("/");
      }
    }

    // finally return the buffed valid thru
    var string = bufferString.toString();

    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
