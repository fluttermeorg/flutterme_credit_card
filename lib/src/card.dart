import 'package:credit_card_flutterme/src/utils/constants.dart';
import 'package:credit_card_flutterme/src/widgets/card_body.dart';
import 'package:flutter/material.dart';

class CreditCardFM extends StatefulWidget {
  ///
  /// <div align="center">
  /// <h2>Credit Card Flutterme</h2>
  /// Creates a customizable credit card widget with validations.
  ///
  /// <img src="https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png" width="100%">
  ///
  /// Made By Flutterme @https://github.com/fluttermeorg
  /// </div>
  const CreditCardFM({
    super.key,
    // card decoration
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
    // card body contain
    this.title = "Flutterme Card",
    this.titleStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.number = "0000000000000000",
    this.numberStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    this.numberMaskType = MaskType.full,
    this.validThur = "****",
    this.validThurStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    this.validThurMaskType = MaskType.full,
    this.cvv = "***",
    this.cvvStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    this.cvvMaskType = MaskType.full,
    this.holder = "John Doe",
    this.holderStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
  });

  /// #### Width
  /// This controls the width of the credit card.
  ///
  /// Note that the width can be your device width, however know that width
  /// restriction has been set between [300]-[430]
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/width.png" width="50%">
  /// </div>
  final double width;

  /// #### Height
  /// This controls the height of the credit card.
  ///
  /// Note that the height can be your device height, however know that height
  /// restriction has been set between [200]-[250]
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/height.png" width="50%">
  /// </div>
  final double height;

  /// #### Padding
  /// Creates an inner space (padding) between the credit card border and the inner widgets
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/padding.png" width="50%">
  /// </div>
  final EdgeInsetsGeometry padding;

  /// #### Margin
  /// Creates an outer space (margin) between the credit card border and the outside layouts.
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/margin.png" width="50%">
  /// </div>
  final EdgeInsetsGeometry margin;

  /// #### Color
  /// To set the background color of the card. This can not be a gradient.
  /// To set a gradient background color use the `backgroundGradient`.
  /// `backgroundColor` and `backgroundGradient` can't be set at same time.
  final Color color;

  /// #### Image
  /// This is to set a background image for the card. When set, `backgroundColor`
  /// and `backgroundGradient` have no effects.
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/image.png" width="50%">
  /// </div>
  final DecorationImage? image;

  /// #### Border
  /// Adjustment of card border.
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/border.png" width="50%">
  /// </div>
  final BoxBorder? border;

  /// #### Border Radius
  /// Adjustment of card border radius.
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/border_radius.png" width="50%">
  /// </div>
  final BorderRadiusGeometry? borderRadius;

  /// #### Box Shadow
  /// Allows the controls of card elevation and shadow directions.
  ///
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/box_shadow.png" width="50%">
  /// </div>
  final List<BoxShadow>? boxShadow;

  /// #### Gradient
  /// This is to set a background gradient color for the card. `backgroundColor` and
  /// `backgroundGradient` can't be set at same time.
  ///
  /// <div align="center">
  /// <img src="https://raw.githubusercontent.com/ibukunoluwanap/credit_card_flutterme/main/images/docs/gradient.png" width="50%">
  /// </div>
  final Gradient? gradient;

  final String title;
  final TextStyle titleStyle;
  final String number;
  final TextStyle numberStyle;
  final MaskType numberMaskType;
  final String validThur;
  final TextStyle validThurStyle;

  /// #### Valid Thur Mask Type
  ///
  /// This only accept the `full` and `none` Mask Types. If any other type is passed it
  /// will return 000.
  final MaskType validThurMaskType;
  final String cvv;
  final TextStyle cvvStyle;

  /// #### CVV Mask Type
  ///
  /// This only accept the `full` and `none` Mask Types. If any other type is passed it
  /// will return 000.
  final MaskType cvvMaskType;
  final String holder;
  final TextStyle holderStyle;

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
      child: CardBody(
        title: widget.title,
        titleStyle: widget.titleStyle,
        number: widget.number,
        numberStyle: widget.numberStyle,
        numberMaskType: widget.numberMaskType,
        validThur: widget.validThur,
        validThurStyle: widget.validThurStyle,
        validThurMaskType: widget.validThurMaskType,
        cvv: widget.cvv,
        cvvStyle: widget.cvvStyle,
        cvvMaskType: widget.cvvMaskType,
        holder: widget.holder,
        holderStyle: widget.holderStyle,
      ),
    );
  }

  /// Return an immutable card constraints
  BoxConstraints cardConstraint() {
    return const BoxConstraints(
      maxWidth: 430,
      minWidth: 300,
      maxHeight: 250,
      minHeight: 200,
    );
  }

  /// Return all card decoration
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
