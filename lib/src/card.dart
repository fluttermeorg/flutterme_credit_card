import 'package:flutterme_credit_card/src/utils/constants.dart';
import 'package:flutterme_credit_card/src/widgets/card_body.dart';
import 'package:flutter/material.dart';

class FMCreditCard extends StatefulWidget {
  /// <div align="center">
  /// <h2>Flutterme Credit Card</h2>
  /// Creates a customizable credit card widget with validations.
  ///
  /// <img src="https://raw.githubusercontent.com/fluttermeorg/.github/main/profile/dashatar.png" width="100%">
  ///
  /// Made By Flutterme @https://github.com/fluttermeorg
  /// </div>
  const FMCreditCard({
    super.key,
    this.width = 430.0,
    this.height = 230.0,
    this.padding = const EdgeInsets.all(10),
    this.margin = const EdgeInsets.all(10),
    this.color = const Color(0xFF49B7AE),
    this.image,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.boxShadow,
    this.gradient,
    this.title = "Flutterme Card",
    this.titleStyle = const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    this.number = "0000000000000000",
    this.numberStyle = const TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    this.numberMaskType = FMMaskType.full,
    this.validThru = "****",
    this.validThruStyle = const TextStyle(color: Colors.white),
    this.validThruMaskType = FMMaskType.full,
    this.cvv = "***",
    this.cvvStyle = const TextStyle(color: Colors.white),
    this.cvvMaskType = FMMaskType.full,
    this.holder = "John Doe",
    this.holderStyle = const TextStyle(fontSize: 20, color: Colors.white),
  });

  /// ## Width
  /// ### **Type:** `double`
  /// ### **Default:** `430.0`
  /// This controls the width of the credit card.
  ///
  /// Note that the width can be your device width, however know that width
  /// restriction has been set between [300]-[430]
  final double width;

  /// ## Height
  /// ### **Type:** `double`
  /// ### **Default:** `230.0`
  /// This controls the height of the credit card.
  ///
  /// Note that the height can be your device height, however know that height
  /// restriction has been set between [200]-[250]
  final double height;

  /// ## Padding
  /// ### **Type:** `EdgeInsetsGeometry`
  /// ### **Default:** `const EdgeInsets.all(10)`
  /// Creates an inner space [padding] between the credit card border and the
  /// inner widgets
  final EdgeInsetsGeometry padding;

  /// ## Margin
  /// ### **Type:** `EdgeInsetsGeometry`
  /// ### **Default:** `const EdgeInsets.all(10)`
  /// Creates an outer space [margin] between the credit card border and the
  /// outside layouts.
  final EdgeInsetsGeometry margin;

  /// ## Color
  /// ### **Type:** `Color`
  /// ### **Default:** `const Color(0xFF49B7AE)`
  /// To set the background color of the card. This can not be a gradient.
  /// To set a gradient background color use the `backgroundGradient`.
  /// `backgroundColor` and `backgroundGradient` can't be set at same time.
  final Color color;

  /// ## Image
  /// ### **Type:** `DecorationImage?`
  /// This is to set a background image for the card. When set, `backgroundColor`
  /// and `backgroundGradient` have no effects.
  final DecorationImage? image;

  /// ## Border
  /// ### **Type:** `BoxBorder?`
  /// Adjustment of card border.
  final BoxBorder? border;

  /// ## Border Radius
  /// ### **Type:** `BorderRadiusGeometry?`
  /// Adjustment of card border radius.
  final BorderRadiusGeometry? borderRadius;

  /// ## Box Shadow
  /// ### **Type:** `List<BoxShadow>?`
  /// Allows the controls of card elevation and shadow directions.
  final List<BoxShadow>? boxShadow;

  /// ## Gradient
  /// ### **Type:** `Gradient?`
  /// This is to set a background gradient color for the card. `backgroundColor` and
  /// `backgroundGradient` can't be set at same time.
  final Gradient? gradient;

  /// ## Title
  /// ### **Type:** `String`
  /// ### **Default:** `Flutterme Card`
  /// This is the card title placement area.
  final String title;

  /// ## Title Style
  /// ### **Type:** `TextStyle`
  /// ### **Default:** `const TextStyle(color: Colors.white, fontSize: 16)`
  /// This is to style the card title name placement area.
  final TextStyle titleStyle;

  /// ## Number
  /// ### **Type:** `String`
  /// ### **Default:** `**** **** **** ****`
  /// This is the card number placement area.
  final String number;

  /// ## Number Style
  /// ### **Type:** `TextStyle`
  /// ### **Default:** `const TextStyle(color: Colors.white)`
  /// This is to style the card number placement area.
  final TextStyle numberStyle;

  /// ## Number Mask Type
  /// ### **Type:** `FMMaskType`
  /// ### **Default:** `FMMaskType.full`
  /// To mask the card number for security reasons. This accept the all Mask Types.
  final FMMaskType numberMaskType;

  /// ## Valid Thru
  /// ### **Type:** `String`
  /// ### **Default:** `****`
  /// This is the card valid thru placement area.
  final String validThru;

  /// ## Valid Thru Style
  /// ### **Type:** `TextStyle`
  /// ### **Default:** `const TextStyle(color: Colors.white)`
  /// This is to style the card valid thru placement area.
  final TextStyle validThruStyle;

  /// ## Valid Thru Mask Type
  /// ### **Type:** `FMMaskType`
  /// ### **Default:** `FMMaskType.full`
  /// To mask the Valid Thru for security reasons. This only accept the `full` and `none` Mask Types.
  /// If any other type is passed it will return "****".
  final FMMaskType validThruMaskType;

  /// ## CVV
  /// ### **Type:** `String`
  /// ### **Default:** `***`
  /// This is the CVV placement area.
  final String cvv;

  /// ## CVV
  /// ### **Type:** `TextStyle`
  /// ### **Default:** `const TextStyle(color: Colors.white)`
  /// This is to style the CVV placement area.
  final TextStyle cvvStyle;

  /// ## CVV Mask Type
  /// ### **Type:** `FMMaskType`
  /// ### **Default:** `FMMaskType.full`
  /// To mask the CVV for security reasons. This only accept the `full` and `none` Mask Types.
  /// If any other type is passed it will return "***".
  final FMMaskType cvvMaskType;

  /// ## Holder
  /// ### **Type:** `String`
  /// ### **Default:** `John Doe`
  /// This is the card holder name placement area.
  final String holder;

  /// ## Holder Style
  /// ### **Type:** `TextStyle`
  /// ### **Default:** `const TextStyle(color: Colors.white, fontSize: 20)`
  /// This is to style the card holder name placement area.
  final TextStyle holderStyle;

  @override
  State<FMCreditCard> createState() => _FMCreditCardState();
}

class _FMCreditCardState extends State<FMCreditCard> {
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
        validThru: widget.validThru,
        validThruStyle: widget.validThruStyle,
        validThruMaskType: widget.validThruMaskType,
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
