import 'package:chat_app/ui/chatpage/chat_cubit.dart';
import 'package:chat_app/ui/chatpage/combonents/senter.dart';
import 'package:chat_app/ui/flash_screen/flash_cubit.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'combonents/reciver.dart';

class ChatPage extends StatelessWidget {
  const ChatPage(
      {super.key,
      required this.name,
      required this.reciver,
      required this.endUserId});

  final String name;
  final String reciver;
  final String endUserId;

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("messege")
              .doc(userId)
              .collection(endUserId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            var userChat = snapshot.data!.docs;
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("messege")
                    .doc(endUserId)
                    .collection(userId!)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("");
                  }
                  var endUserChat = snapshot.data!.docs;
                  List chatList = List.from(userChat)..addAll(endUserChat);

                  chatList.sort(
                    (a, b) {
                      var first = DateTime.parse(a["time"]);
                      var second = DateTime.parse(b["time"]);
                      return first.compareTo(second);
                    },
                  );

                  return BlocProvider(
                    create: (context) => ChatCubit(endUserId),
                    child: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        final cubit = context.read<ChatCubit>();
                        return Column(
                          children: [
                            Expanded(
                              flex: 9,
                              child: ListView.builder(
                                itemCount: chatList.length,
                                itemBuilder: (context, index) {
                                  DateTime dateTime =
                                      DateTime.parse(chatList[index]["time"]);
                                  String formattedDateTime =
                                      DateFormat("hh:mm a").format(dateTime);

                                  return chatList[index]["senter"] == userId
                                      ? BubbleSpecialThree(
                                    delivered: true,
                                          seen: false,
                                          text: chatList[index]["messege"],
                                        )
                                      : BubbleSpecialThree(
                                    color: Colors.black12,

                                          isSender: false,
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          text: chatList[index]["messege"],
                                        );
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 320,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: TextFormField(
                                      onChanged: (va) {
                                        cubit.refresh();
                                      },
                                      controller: cubit.chat,
                                      decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300),
                                          hintText: "   Type here",
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  cubit.chat.text.isNotEmpty
                                      ? IconButton(
                                          onPressed: () {
                                            cubit.dataStore();
                                          },
                                          icon: const Icon(
                                            Icons.send,
                                            size: 40,
                                          ),
                                        )
                                      : Icon(Icons.mic)
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  );
                });
          }),
    );
  }
}
