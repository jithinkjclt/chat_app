
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chat_app/model/login_model.dart';
import 'package:flutter/material.dart';

import '../../Localstorage/LocalStorage.dart';
import '../Log/log.dart';
import '../chat_list/chatlist.dart';

part 'flash_state.dart';
String? userId;
String? valueUser;
class FlashCubit extends Cubit<FlashState> {
  FlashCubit(this.context) : super(FlashInitial()) {
    delay();
  }

  String? value;
  BuildContext context;

  delay() async {
    await Future.delayed(const Duration(seconds: 1));
    flash();
  }

  flash() async {
    value = await LocalStorage.getUser();
    // print(data.email);
    print(value);
    if(value!=null){
      LoginModel data = LoginModel.fromJson(jsonDecode(value!));
      userId = data.userId;
      valueUser = data.email;
      // print(data.email);
      print(">>>>>>>>>>>>>>>>>>>>>>$value");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>  ChatList()),
      );
    }else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>  log() ),
      );
    }
  }
}
