import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String leadingText;
  final String trailingText;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    required this.color,
    required this.leadingText,
    required this.trailingText,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Text(
            leadingText,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor),
          ),
        ),
        Text(
          trailingText,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}
