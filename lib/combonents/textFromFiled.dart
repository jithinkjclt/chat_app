import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textFrom extends StatelessWidget {
  const textFrom({
    super.key,
    required this.hint,
    required this.controller,
    required this.time,
    required this.pad,
  });

  final TextEditingController controller;
  final int time;
  final double pad;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: time),
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black12,
            )),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color:Color(0xFFeb009b),
            ))),
      ),
    );
  }
}
