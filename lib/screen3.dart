

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musify_app/screen10.dart';
import 'package:musify_app/screen2.dart';


class Screen3 extends StatefulWidget {

  String emailFromSignUp;
  String passwordFromSignUp;

  Screen3(this.emailFromSignUp, this.passwordFromSignUp);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _isChecked = false;
  bool _isObscureText = true;
  String emailFromFirestore = "";
  String passwordFromFirestore = "";

  bool signUpWithNewId = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 50),
          child: Column(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,),),
                ),
                onTap: ()  {
                  // await Future.delayed(Duration(milliseconds: 500));
                  // signUpWithNewId = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen2(),),);
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topLeft,
                child: Image.asset("assests/images/musifysmall.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.topLeft,
                child: Text("Musify", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35,),),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffix: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Text("Show", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.bold, fontSize: 18),),
                              onTap: () {
                                setState(() {
                                  if (_isObscureText) {
                                    _isObscureText = false;
                                  }
                                  else {
                                    _isObscureText = true;
                                  }
                                });

                              },),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(top: 50),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xFFd4b300)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),),
                  ),
                  onPressed: () async {


                    FirebaseAuth auth = FirebaseAuth.instance;
                    User? user = auth.currentUser;
                    // print("User is ${user?.uid}");

                    if (user != null) {
                      CollectionReference<Map<String, dynamic>> collection =
                      FirebaseFirestore.instance.collection("Users");
                      CollectionReference<Map<String, dynamic>> profileCollection = collection.doc(user.uid).collection("Profile");

                      DocumentSnapshot snapshot =
                      await profileCollection.doc(user.uid).get();

                      if (snapshot.exists) {
                        // Access document data using snapshot.data()
                        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
                        // Perform desired operations with the data

                        emailFromFirestore = data["Email"];
                        passwordFromFirestore = data["Password"];
                        print("User is $emailFromFirestore");
                      }
                    }

                    if (emailFromFirestore == emailController.text.toString() && passwordFromFirestore == passwordController.text.toString()) {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen10(emailController.text.toString(), passwordController.text.toString(), "", "", "", ""),),);
                    }
                  },
                  child: Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text("Forgot your password?", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.bold, fontSize: 18),),
              )
            ],
          ),

        ),
      ),
    );
  }
}
