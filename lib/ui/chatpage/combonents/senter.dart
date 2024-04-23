import 'package:flutter/material.dart';

import '../../../combonents/sizedBox.dart';

class Senter extends StatelessWidget {
  const Senter({super.key, required this.text, required this.time});

  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const B(x: 5),
             Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
            Container(
              width: 280,
              height: 100,
              decoration: const BoxDecoration(
                  color: Color(0xFF211F53),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
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
          ],
        ),
        const B(x: 15),
      ],
    );
  }
}
