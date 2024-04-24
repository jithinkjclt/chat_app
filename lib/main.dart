import 'package:chat_app/ui/Log/log.dart';
import 'package:chat_app/ui/flash_screen/flash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Connectify ',
      debugShowCheckedModeBanner: false,
      home: Flash(),
    );
  }
}

