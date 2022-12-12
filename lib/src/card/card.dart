import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  const Card({
    super.key,
    this.width = 430,
    this.height = 250,
    this.backgroundColor = const Color(0x0149B7AE),
    this.image = "",
    this.border = const Border(
      top: BorderSide.none,
      right: BorderSide.none,
      bottom: BorderSide.none,
      left: BorderSide.none,
    ),
    this.borderRadius = BorderRadius.zero,
    this.boxShadow = const [],
    this.gradient = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topRight,
      colors: [Color(0x0149B7AE), Color(0x0130A4DF)],
    ),
  });
  final double width;
  final double height;
  final Color backgroundColor;
  final String image;
  final BoxBorder border;
  final BorderRadiusGeometry borderRadius;
  final List<BoxShadow> boxShadow;
  final Gradient gradient;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      constraints: const BoxConstraints(maxWidth: 430.0, minWidth: 360),
      decoration: cardDecoration(),
    );
  }

  Decoration cardDecoration() {
    return BoxDecoration(
      color: widget.backgroundColor,
      image: DecorationImage(
        image: AssetImage(widget.image),
        fit: BoxFit.cover,
      ),
      border: widget.border,
      borderRadius: widget.borderRadius,
      boxShadow: widget.boxShadow,
      gradient: widget.gradient,
    );
  }
}
