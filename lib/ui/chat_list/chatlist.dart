import 'package:chat_app/ui/Log/log.dart';
import 'package:chat_app/ui/chatpage/chatPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Localstorage/LocalStorage.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    LocalStorage().deleteUser();
                    return log();
                  },
                ));
              },
              child: const Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Icon(Icons.logout),
                  Text(" L O G O U T")
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "My Chat",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("user").snapshots(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ChatPage(
                                  name: snapshot.data!.docs[index]["name"],
                                  reciver: snapshot.data!.docs[index]["user"],
                                );
                              },
                            ));
                          },
                          child: ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            shape: Border.all(color: Colors.black),
                            title: Text(snapshot.data!.docs[index]["name"]),
                          ),
                        ),
                      );
                    },
                    itemCount: snapshot.data!.docs.length);
          },
        ));
  }
}
