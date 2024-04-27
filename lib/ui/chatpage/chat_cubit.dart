import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chat_app/model/login_model.dart';
import 'package:chat_app/ui/flash_screen/flash_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../Localstorage/LocalStorage.dart';

part 'chat_state.dart';

String? values;
String? chatRoomId;

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.endUserId) : super(ChatInitial());

  TextEditingController chat = TextEditingController();
  String endUserId;

  dataStore() async {
    String? data = await LocalStorage.getUser();
    LoginModel dataValue = LoginModel.fromJson(jsonDecode(data!));


    FirebaseFirestore.instance
        .collection("messege")
        .doc(dataValue.userId)
        .collection(endUserId)
        .add({
      "messege": chat.text,
      "time": DateTime.now().toString(),
      "senter": userId,
    });

    chat.clear();
    // refresh();

  }

  refresh() {
    emit(ChatInitial());
  }
}

