import 'package:credit_card_flutterme/src/utils/constants.dart';
import 'package:credit_card_flutterme/src/utils/exceptions.dart';

// extension for int manipulations 
extension Range on num {
  bool isBetween(num from, num to) {
    return from <= this && this <= to;
  }
}

CardType detectCardType({required String number}) {
  CardType cardType = CardType.chip; // default

  // check for white space
  number = number.replaceAll(RegExp(r'\s+\b|\b\s'), "");

  // check if number is empty
  if (number.isEmpty) return cardType;

  // check if contain only numerics
  if (RegExp(r'\D+').hasMatch(number)) return cardType;

  numberPattern.forEach(
    (CardType type, Set<List<String>> patterns) {
      for (List<String> pattern in patterns) {
        // creating inner card number variable storage
        String newNumber = number;

        // get the pattern length
        int patternLength = pattern[0].length;

        if (patternLength < number.length) {
          newNumber = newNumber.substring(0, patternLength);
        }

        if (pattern.length > 1) {
          // making parser to int for manipulation
          int numberAsInt = int.parse(newNumber);
          int startPattern = int.parse(pattern[0]);
          int endPattern = int.parse(pattern[1]);

          // check if it contains ending pattern or not
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

  return cardType;
}

String cardIcon({required String number}) {
  switch (detectCardType(number: number)) {
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

String maskValidThur({required String validThur, required MaskType maskType}) {
  // getting mask type condition added by the developer
  bool full = maskType == MaskType.full;
  bool none = maskType == MaskType.none;
  String mask = "0000"; // default
  var bufferString = StringBuffer();

  if (validThur.length != 4) {
    throw FluttermeCardException(
      "Valid Thur must be 4 characters in length. They first two characters represent the MONTH and the last two characters represent the YEAR!",
    );
  }

// get current year
  int currentMonth = DateTime.now().month;
  int currentYear = int.parse("${DateTime.now().year}".substring(2, 4));

  // get the given month
  int month = int.parse(validThur.substring(0, 2));
  // get the given year
  int year = int.parse(validThur.substring(2, 4));

  // check if month is valid
  bool isMonthValid = month.isBetween(1, 12);
  // check if year is valid
  bool isYearValid = year >= currentYear;

  if (!isMonthValid) {
    throw FluttermeCardException(
      "Invalid month given. Month range must be between 01-12!",
    );
  }

  if (!isYearValid) {
    throw FluttermeCardException(
      "Invalid year given. Year must be in the future!",
    );
  }

  // To handle expiring card
  if (month == currentMonth && year == currentYear) {
    //   throw FluttermeCardException("Card expiring this month!");
  }

  if (full) {
    mask = "*" * validThur.length;
  } else if (none) {
    mask = validThur;
  }

  for (int i = 0; i < mask.length; i++) {
    bufferString.write(mask[i]);
    var nonZeroIndexValue = i + 1;
    if (nonZeroIndexValue % 2 == 0 && nonZeroIndexValue != mask.length) {
      bufferString.write("/");
    }
  }

  return bufferString.toString();
}

String maskCVV({required String cvv, required MaskType maskType}) {
  // getting mask type condition added by the developer
  bool full = maskType == MaskType.full;
  bool none = maskType == MaskType.none;
  String mask = "000"; // default

  // check if cvv is valid
  bool isCVVValid = cvv.length.isBetween(3, 4);

  if (!isCVVValid) {
    throw FluttermeCardException("CVV must be 3 or 4 characters in length!");
  }

  if (full) {
    mask = "*" * cvv.length;
  } else if (none) {
    mask = cvv;
  }

  return mask;
}
