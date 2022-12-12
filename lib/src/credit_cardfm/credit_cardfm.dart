import 'package:credit_card_flutterme/src/credit_cardfm/widgets/card_body.dart';
import 'package:flutter/material.dart';

class CreditCardFM extends StatefulWidget {
  /// Creates a customizable credit card widget with validations.
  ///
  /// <img src="https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png" width="100%">
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

  /// This controls the width of the credit card.
  ///
  /// Note that the width can be your device width, however know that width
  /// restriction has been set between [300]-[430]
  ///
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/width.png" width="80%">
  final double width;

  /// This controls the height of the credit card.
  ///
  /// Note that the height can be your device height, however know that height
  /// restriction has been set between [200]-[250]
  ///
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/height.png" width="80%">
  final double height;

  /// Creates an inner space (padding) between the credit card border and the inner widgets
  ///
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/padding.png" width="80%">
  final EdgeInsetsGeometry padding;

  /// Creates an outer space (margin) between the credit card border and the outside layouts.
  ///
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/margin.png" width="80%">
  final EdgeInsetsGeometry margin;

  /// To set the background color of the card. This can not be a gradient.
  /// To set a gradient background color use the `backgroundGradient`.
  /// *backgroundColor* and *backgroundGradient* can't be set at same time.
  final Color color;

  /// This is to set a background image for the card. When set, *backgroundColor*
  /// and *backgroundGradient* have no effects.
  final DecorationImage? image;

  /// Adjustment of card border.
  final BoxBorder? border;

  /// Adjustment of card border radius.
  final BorderRadiusGeometry? borderRadius;

  /// Allows the controls of card elevation and shadow directions.
  final List<BoxShadow>? boxShadow;

  /// This is to set a background gradient color for the card. *backgroundColor* and
  /// *backgroundGradient* can't be set at same time.
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

/// used in the selection of card type during the card validation stage.
/// This have all the type of supported cards in a `enum`.
///
/// LIST OF SUPPORTED CARDS
/// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/support_cards.png" width="80%">
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
