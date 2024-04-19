import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../combonents/sizedBox.dart';

class Reciver extends StatelessWidget {
  const Reciver({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 280,
              height: 100,
              decoration: const BoxDecoration(
                  color: Color(0xFFCECCFF),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(45),
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Column(
                children: [
                  const B(x: 30),
                  Row(
                    children: [
                      const B(x: 25),
                      Text(
                        text,
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const B(x: 5),
            const Text(
              "12.34",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const B(x: 20),
      ],
    );
  }
}
