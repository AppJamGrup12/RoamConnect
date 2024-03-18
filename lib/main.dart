import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whisper2/lib/user_list.dart';
import 'package:whisper2/lib/user_model.dart';
import 'package:whisper2/log_in.dart';
import 'package:whisper2/signup_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GirisEkrani(),
    );
  }
}


