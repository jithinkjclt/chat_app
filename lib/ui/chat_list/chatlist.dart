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
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  LocalStorage().deleteUser();
                  return log();
                },
              ));
            },
            child: const Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "user",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Email id",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.logout),
                    Text(" L O G O U T")
                  ],
                ),
                SizedBox(
                  height: 25,
                )
              ],
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
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                scrollDirection: axisDirectionToAxis(AxisDirection.down),
                itemBuilder: (context, index) {

                  List userList = snapshot.data!.docs;
                  userList.remove(userList[index]["user_id"]);

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ChatPage(
                            endUserId: userList[index]["user_id"],
                            name: userList[index]["name"],
                            reciver: userList[index]["user"],
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black12, width: .5)),
                      height: 65,
                      width: 300,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(snapshot.data!.docs[index]["name"]),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data!.docs.length - 1);
          },
        ));
  }
}
