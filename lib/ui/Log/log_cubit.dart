import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chat_app/model/login_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Localstorage/LocalStorage.dart';
import '../chat_list/chatlist.dart';
import '../flash_screen/flash_screen.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  LogCubit(this.context) : super(LogInitial());
  BuildContext context;

  bool flag = true;
  bool change = true;

  TextEditingController userctr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController namectr = TextEditingController();


  bool flame = true;


  registor() async {
    try {
      UserCredential data = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: userctr.text.trim(), password: passctr.text.trim());
      if (data.user != null) {
        LoginModel logvar = LoginModel(
          email: data.user!.email,
          userId: data.user!.uid.toString(),
          username: namectr.text.trim(),
        );
        LocalStorage.setUser(jsonEncode(logvar.toJson()));

        await FirebaseFirestore.instance
            .collection("user")
            .add({"user": userctr.text, "name": namectr.text,"user_id":data.user!.uid });
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const Flash();
        }));
      } else {
        print("sdfsdafs");
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger(
          child: AlertDialog(
        backgroundColor: Colors.red,
        title: Text(e.code),
      ));
    }
  }

  login() async {
    if (userctr.text.isNotEmpty && passctr.text.isNotEmpty) {
      flame = false;
      emit(LogInitial());

      try {
        UserCredential data = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: userctr.text.trim(), password: passctr.text.trim());
        if (data.user != null) {
          LoginModel logvar = LoginModel(
            email: data.user!.email,
            userId: data.user!.uid.toString(),
          );
          LocalStorage.setUser(jsonEncode(logvar.toJson()));


          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const Flash();
          }));
        } else {
          print("sdfsdafs");
        }
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

  regi() {
    flag = true;
    emit(LogInitial());
  }

  log() {
    flag = false;
    emit(LogInitial());
  }
}
