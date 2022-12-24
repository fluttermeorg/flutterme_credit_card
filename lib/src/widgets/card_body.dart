import 'package:flutterme_credit_card/src/utils/constants.dart';
import 'package:flutterme_credit_card/src/utils/validations.dart';
import 'package:flutter/material.dart';

class CardBody extends StatefulWidget {
  /// ## Card Body
  /// This contain all the data within the card. Such data include
  /// * Title
  /// * Title Style
  /// * Number
  /// * Number Style
  /// * Valid Thur
  /// * Valid Thur Style
  /// * CVV
  /// * CVV Style
  /// * Holder
  /// * Holder Style
  /// * Card Type
  const CardBody({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.number,
    required this.numberStyle,
    required this.numberMaskType,
    required this.validThur,
    required this.validThurStyle,
    required this.validThurMaskType,
    required this.cvv,
    required this.cvvStyle,
    required this.cvvMaskType,
    required this.holder,
    required this.holderStyle,
  });
  final String title;
  final TextStyle titleStyle;
  final String number;
  final TextStyle numberStyle;
  final FMMaskType numberMaskType;
  final String validThur;
  final TextStyle validThurStyle;
  final FMMaskType validThurMaskType;
  final String cvv;
  final TextStyle cvvStyle;
  final FMMaskType cvvMaskType;
  final String holder;
  final TextStyle holderStyle;

  @override
  State<CardBody> createState() => _CardBodyState();
}

class _CardBodyState extends State<CardBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header(), body(), footer()],
    );
  }

  /// ## Header
  /// ### **Type:** `Widget`
  /// The card header containing the *Card Title* and the *Card Type*
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
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            cardIcon(number: widget.number),
            width: 60,
            fit: BoxFit.cover,
            package: "flutterme_credit_card",
          ),
        )
      ],
    );
  }

  /// ## Body
  /// ### **Type:** `Widget`
  /// The card body containing the *Card Number*, *Card Valid Thur* and the *Card CVV*
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            maskCardNumber(
              number: widget.number,
              maskType: widget.numberMaskType,
            ),
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
                  Text(
                    maskValidThur(
                      validThur: widget.validThur,
                      maskType: widget.validThurMaskType,
                    ),
                    style: widget.validThurStyle,
                  ),
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
                  Text(
                    maskCVV(
                      cvv: widget.cvv,
                      maskType: widget.cvvMaskType,
                    ),
                    style: widget.cvvStyle,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  /// ## Footer
  /// ### **Type:** `Widget`
  /// The card footer containing the *Card Holder Name*
  Widget footer() {
    return Text(
      widget.holder,
      style: widget.holderStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
