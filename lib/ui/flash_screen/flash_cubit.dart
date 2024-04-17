import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../Localstorage/LocalStorage.dart';
import '../Log/log.dart';
import '../chat_list/chatlist.dart';

part 'flash_state.dart';

class FlashCubit extends Cubit<FlashState> {
  FlashCubit(this.context) : super(FlashInitial()){
    delay();
  }
  BuildContext context;

  delay() async {
    await Future.delayed(const Duration(seconds: 1));
    flash();
  }
  flash() async {
    String? value = await LocalStorage().getUser();
    print(">>>>>>>>>>>>>>>>$value");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => value == null ? log() : ChatList()),
    );
  }
}
