import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../chat_list/chatlist.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit(this.context) : super(LogInitial());
  BuildContext context;

  bool flag = true;
  bool change = true;


  TextEditingController userctr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  bool flame = true;

  login() async {
    if (userctr.text.isNotEmpty && passctr.text.isNotEmpty) {
      flame = false;
      emit(LogInitial());

      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: userctr.text.trim(), password: passctr.text.trim())
            .then((value) => Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {


          return ChatList();
        })));
      } on FirebaseException catch (e) {
        flame = true;

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("This fields is required"),
        backgroundColor: Colors.red,
      ));
    }

    emit(LogInitial());
  }



















  chanager() {
    change = !change;
    print(">>>>>>>>>>>>>>>>>>>>$change");
    emit(LogInitial());
  }

  regi() {
    flag = true;
    emit(LogInitial());
  }

  log() {
    flag = false;
    emit(LogInitial());
  }
}
