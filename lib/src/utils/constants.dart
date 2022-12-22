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

Map<CardType, Set<List<String>>> numberPattern = {
  CardType.amex: {
    ["34"],
    ["37"],
  },
  CardType.diners: {
    ["300", "305"],
    ["36"],
    ["38"],
    ["39"],
  },
  CardType.discover: {
    ["6011"],
    ["644", "649"],
    ["65"],
  },
  CardType.elo: {
    ["401178"],
    ["401179"],
    ["438935"],
    ["457631"],
    ["457632"],
    ["431274"],
    ["451416"],
    ["457393"],
    ["504175"],
    ["506699", "506778"],
    ["509000", "509999"],
    ["627780"],
    ["636297"],
    ["636368"],
    ["650031", "650033"],
    ["650035", "650051"],
    ["650405", "650439"],
    ["650485", "650538"],
    ["650541", "650598"],
    ["650700", "650718"],
    ["650720", "650727"],
    ["650901", "650978"],
    ["651652", "651679"],
    ["655000", "655019"],
    ["655021", "655058"],
  },
  CardType.hipercard: {
    ["606282"],
    ["637095"],
    ["637568"],
    ["637599"],
    ["637609"],
    ["637612"],
    ["63743358"],
    ["63737423"],
  },
  CardType.jcb: {
    ["3528", "3589"],
    ["2131"],
    ["1800"],
  },
  CardType.maestro: {
    ["493698"],
    ["500000", "506698"],
    ["506779", "508999"],
    ["56", "59"],
    ["63"],
    ["67"],
  },
  CardType.mastercard: {
    ["51", "55"],
    ["2221", "2229"],
    ["223", "229"],
    ["23", "26"],
    ["270", "271"],
    ["2720"],
  },
  CardType.mir: {
    ["2200", "2204"],
  },
  CardType.unionpay: {
    ["620"],
    ["624", "626"],
    ["62100", "62182"],
    ["62184", "62187"],
    ["62185", "62197"],
    ["62200", "62205"],
    ["622010", "622999"],
    ["622018"],
    ["622019", "622999"],
    ["62207", "62209"],
    ["622126", "622925"],
    ["623", "626"],
    ["6270"],
    ["6272"],
    ["6276"],
    ["627700", "627779"],
    ["627781", "627799"],
    ["6282", "6289"],
    ["6291"],
    ["6292"],
    ["810"],
    ["8110", "8131"],
    ["8132", "8151"],
    ["8152", "8163"],
    ["8164", "8171"],
  },
  CardType.visa: {
    ["4"],
  }
};
