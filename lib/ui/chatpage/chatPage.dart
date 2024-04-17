import 'package:chat_app/ui/chatpage/chat_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("messege")
              .orderBy("time")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return BlocProvider(
              create: (context) => ChatCubit(),
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  final cubit = context.read<ChatCubit>();
                  return Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return snapshot.data!.docs[index]["user"] ==
                                values ?
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    snapshot.data!.docs[index]["messege"])):Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    snapshot.data!.docs[index]["messege"]));
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
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                controller: cubit.chat,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300),
                                    hintText: "   Type here",
                                    border: InputBorder.none),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.dataStore();
                              },
                              icon: const Icon(
                                Icons.send,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          }),
    );
  }
}
