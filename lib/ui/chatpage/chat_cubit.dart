import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Localstorage/LocalStorage.dart';

part 'chat_state.dart';

String? values;

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.reciver) : super(ChatInitial());

  TextEditingController chat = TextEditingController();
String reciver;
  dataStore() async {
    String senter = await LocalStorage().getUser();
    values = senter;
    FirebaseFirestore.instance.collection("messege").add({
      "messege": chat.text,
      "time": DateTime.now(),
      "senter": senter,
      "receiver": reciver
    });
    chat.clear();
  }
}
