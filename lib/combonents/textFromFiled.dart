import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class textFrom extends StatelessWidget {
  const textFrom({
    super.key,
    required this.hint,
    required this.pri,
    required this.controller,
    required this.onTap,
    required this.time,
    required this.pad,
  });

  final TextEditingController controller;
  final int time;
  final double pad;
  final String hint;
  final bool pri;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: Duration(milliseconds: time),
      padding: EdgeInsets.symmetric(horizontal: pad),
      child: TextFormField(
        controller: controller,
        obscureText: pri,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: onTap, icon: const Icon(Icons.remove_red_eye)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black12,
            )),
            hintText: hint,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            ))),
      ),
    );
  }
}
