import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        backgroundColor: Colors.green,
        leading: Row(
          children: [
            const SizedBox(width: 10),
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back)),
            const SizedBox(width: 10),
            const CircleAvatar()
          ],
        ),
        automaticallyImplyLeading: true,
        actions: const [
          Icon(
            Icons.videocam,
            color: Colors.black,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30),
            child: Icon(
              Icons.call,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ],
        title: Text(name.toUpperCase()),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
