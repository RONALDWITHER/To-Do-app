import 'package:flutter/material.dart';
import 'dart:async';

import 'package:todolist/principaltela.dart';

class Logotela extends StatefulWidget {
  @override
  _LogotelaState createState() => _LogotelaState();
}

class _LogotelaState extends State<Logotela> {
  void initState() {
    setState(() {
      Timer(Duration(seconds: 5), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => TodoListScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 190),
          Image.asset(
            'assets/logo.png',
            width: 300,
            height: 300,
          ),
          const SizedBox(height: 100),
          const CircularProgressIndicator(
            color: Color.fromARGB(255, 248, 248, 248),
          ),
        ],
      )),
      backgroundColor: Color.fromARGB(248, 23, 0, 233),
    );
  }
}
