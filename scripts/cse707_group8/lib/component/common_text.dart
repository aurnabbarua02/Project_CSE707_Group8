import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    required this.fontsize,
    this.color = Colors.black,
    this.fontWeight
  });
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontsize, color: color, fontWeight: fontWeight),
    );
  }
}
