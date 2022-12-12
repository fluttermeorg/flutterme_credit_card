import 'package:credit_card_flutterme/src/credit_cardfm/widgets/card_body.dart';
import 'package:flutter/material.dart';

class CreditCardFM extends StatefulWidget {
  /// Creates a customizable credit card widget with validations.
  /// 
  /// ![](https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png)
  /// 
  /// Made By Flutterme @https://github.com/fluttermeorg
  const CreditCardFM({
    super.key,
    this.width = 430,
    this.height = 230,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(10),
    this.color = const Color(0xFF49B7AE),
    this.image,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.boxShadow,
    this.gradient,
  });

  /// This controls the width of your card.
  ///
  /// Note that the width can be your device width, however know that width
  /// restriction has been set between [300]-[430]
  /// 
  /// ![]()
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color color;
  final DecorationImage? image;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  @override
  State<CreditCardFM> createState() => _CreditCardFMState();
}

class _CreditCardFMState extends State<CreditCardFM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      margin: widget.margin,
      constraints: cardConstraint(),
      decoration: cardDecoration(),
      child: const CardBody(),
    );
  }

  BoxConstraints cardConstraint() {
    return const BoxConstraints(
      maxWidth: 430,
      minWidth: 300,
      maxHeight: 250,
      minHeight: 200,
    );
  }

  Decoration cardDecoration() {
    return BoxDecoration(
      color: widget.color,
      image: widget.image,
      border: widget.border,
      borderRadius: widget.borderRadius,
      boxShadow: widget.boxShadow,
      gradient: widget.gradient,
    );
  }
}

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
