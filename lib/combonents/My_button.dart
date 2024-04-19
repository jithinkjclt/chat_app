import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  const button(
      {super.key, required this.text, required this.color, required this.radi});

  final String text;
  final Color color;
  final double radi;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radi), color: color),
      height: 50,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.add), Text(text)],
      ),
    );
  }
}
