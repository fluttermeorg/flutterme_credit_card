/// ## FM Card Type
/// ### **Type:** `enum`
/// Used in the selection of card type during the card validation stage.
/// This have all the type of supported cards.
enum FMCardType {
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

/// ## FM Mask Type
/// ### **Type:** `enum`
/// Used in the masking validation. This have all the supported mask types.
enum FMMaskType {
  full,
  first4Last4,
  first6last2,
  first2last6,
  none,
}

/// ## FM Mask Type
/// ### **Type:** `Map<FMCardType, Set<List<String>>>`
/// The are they patterns for all the supported card companies.
Map<FMCardType, Set<List<String>>> numberPattern = {
  FMCardType.amex: {
    ["34"],
    ["37"],
  },
  FMCardType.diners: {
    ["300", "305"],
    ["36"],
    ["38"],
    ["39"],
  },
  FMCardType.discover: {
    ["6011"],
    ["644", "649"],
    ["65"],
  },
  FMCardType.elo: {
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
  FMCardType.hipercard: {
    ["606282"],
    ["637095"],
    ["637568"],
    ["637599"],
    ["637609"],
    ["637612"],
    ["63743358"],
    ["63737423"],
  },
  FMCardType.jcb: {
    ["3528", "3589"],
    ["2131"],
    ["1800"],
  },
  FMCardType.maestro: {
    ["493698"],
    ["500000", "506698"],
    ["506779", "508999"],
    ["56", "59"],
    ["63"],
    ["67"],
  },
  FMCardType.mastercard: {
    ["51", "55"],
    ["2221", "2229"],
    ["223", "229"],
    ["23", "26"],
    ["270", "271"],
    ["2720"],
  },
  FMCardType.mir: {
    ["2200", "2204"],
  },
  FMCardType.unionpay: {
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
  FMCardType.visa: {
    ["4"],
  }
};
