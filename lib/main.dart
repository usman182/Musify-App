import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musify_app/screen10.dart';
import 'package:musify_app/screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Musify App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final String documentId = "";

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {

      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Screen2(),));
    },);


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assests/images/musify.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Musify", style: TextStyle(color: Colors.white, fontSize: 50,)),
          ],
        ),
      ),
    );
  }
}
