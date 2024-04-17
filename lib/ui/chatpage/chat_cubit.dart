import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Localstorage/LocalStorage.dart';

part 'chat_state.dart';

String? values;

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  TextEditingController chat = TextEditingController();

  dataStore() async {
    String value = await LocalStorage().getUser();
    print("<<<<<<<<<<<<<<<<<<<<<<<<<<<$value");
    values = value;
    FirebaseFirestore.instance
        .collection("messege")
        .add({"messege": chat.text, "time": DateTime.now(), "user": value});
    chat.clear();
  }
}
