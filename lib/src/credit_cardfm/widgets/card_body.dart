import 'package:credit_card_flutterme/credit_card_flutterme.dart';
import 'package:flutter/material.dart';

class CardBody extends StatefulWidget {
  /// #### Card Body
  /// This contain all the data within the card. Such data include
  /// - Title
  /// - Title Style
  /// - Number
  /// - Number Style
  /// - Valid Thur
  /// - Valid Thur Style
  /// - CVV
  /// - CVV Style
  /// - Holder
  /// - Holder Style
  /// - Card Type
  /// 
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/card.png" width="50%">
  /// </div>
  const CardBody({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.number,
    required this.numberStyle,
    required this.validThur,
    required this.validThurStyle,
    required this.cvv,
    required this.cvvStyle,
    required this.holder,
    required this.holderStyle,
    required this.cardType,
  });
  final String title;
  final TextStyle titleStyle;
  final String number;
  final TextStyle numberStyle;
  final String validThur;
  final TextStyle validThurStyle;
  final String cvv;
  final TextStyle cvvStyle;
  final String holder;
  final TextStyle holderStyle;
  final CardType cardType;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(),
        body(),
        footer(),
      ],
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.title,
            style: widget.titleStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Image.asset(
          cardTypeIcon(widget.cardType),
          width: 60,
          fit: BoxFit.cover,
          package: "credit_card_flutterme",
        )
      ],
    );
  }

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.number,
            style: widget.numberStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Valid Thur",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(widget.validThur, style: widget.validThurStyle),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "CVV",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  Text(widget.cvv, style: widget.cvvStyle),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget footer() {
    return Text(
      widget.holder,
      style: widget.holderStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String cardTypeIcon(CardType type) {
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
}
