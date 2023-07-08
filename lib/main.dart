import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:musify_app/screen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:musify_app/screen3.dart';
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
  bool signUpWithNewId = false;
  var emailFromFirestore = "",
      passwordFromFirestore = "";

  @override
  void initState() {
    super.initState();

    // getCurrentUserData();


    Timer(Duration(seconds: 2), () {
      // signUpWithNewId = true;
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => Screen2(),));
    },);


  }

  // Future<void> getCurrentUserData() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //
  //   if (user != null) {
  //     CollectionReference<Map<String, dynamic>> collection =
  //     FirebaseFirestore.instance.collection("Users");
  //
  //     DocumentSnapshot snapshot =
  //     await collection.doc(user.uid).get();
  //
  //     if (snapshot.exists) {
  //       // Access document data using snapshot.data()
  //       Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //       // Perform desired operations with the data
  //
  //       emailFromFirestore = data["Email"];
  //       passwordFromFirestore = data["Password"];
  //       print("User is $emailFromFirestore");
  //     }
  //     Navigator.push(context,
  //       MaterialPageRoute(builder: (context) {
  //         return Screen3(emailFromFirestore,
  //             passwordFromFirestore);
  //       }),);
  //   }
  //   else {
  //     // await Future.delayed(Duration(milliseconds: 500));
  //       signUpWithNewId = true;
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => Screen2(signUpWithNewId),),
  //       );
  //   }
  //
  // }


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
