




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musify_app/screen3.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Screen2 extends StatefulWidget {


  // bool signUpWithNewIdFromScreen3OrMain;

  // Screen2(this.signUpWithNewIdFromScreen3OrMain);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool _isChecked = false;
  bool _isObscureText = true;


  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  var emailFromFirestore = "",
      passwordFromFirestore = "";


  // @override
  // void initState() {
  //   super.initState();
  //
  //   if (!widget.signUpWithNewIdFromScreen3OrMain) {
  //     getCurrentUserData();
  //   }
  //   else {
  //     Navigator.push(context,
  //       MaterialPageRoute(builder: (context) =>
  //           Screen3("", ""),),);
  //   }
  // }



  // Future<void> getCurrentUserData() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user = auth.currentUser;
  //
  //   if (user != null) {
  //     CollectionReference<Map<String, dynamic>> collection =
  //     FirebaseFirestore.instance.collection("Users");
  //     QuerySnapshot<Map<
  //         String,
  //         dynamic>> snapshot = await collection.get();
  //
  //     List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = snapshot
  //         .docs;
  //     for (var document in documents) {
  //       // Access document data using document.data()
  //       Map<String, dynamic> data = document.data();
  //       // Perform desired operations with the data
  //
  //       emailFromFirestore = data["Email"];
  //       passwordFromFirestore = data["Password"];
  //     }
  //
  //     Navigator.pushReplacement(context,
  //       MaterialPageRoute(builder: (context) {
  //         return Screen3(emailFromFirestore,
  //             passwordFromFirestore);
  //       }),);
  //   }
  //
  // }


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
                  child: Text("Sign In", style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,),),
                ),
                onTap: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        Screen3(emailController.text.toString(),
                            passwordController.text.toString()),),);
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
                child: Text("Musify", style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,),),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: TextField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Name",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      child: TextField(
                        obscureText: _isObscureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                            suffix: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Text("Show", style: TextStyle(
                                  color: Color(0xFFd4b300),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),),
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 10, top: 30),
                child: Text("Gender", style: TextStyle(color: Color(0xFFd4b300),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,),),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assests/images/male.png"),
                    Image.asset("assests/images/female.png"),
                    Image.asset("assests/images/unknown.png"),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    CheckboxTheme(
                      data: CheckboxThemeData(
                        fillColor: MaterialStateProperty.resolveWith((
                            states) => Colors.white),
                        checkColor: MaterialStateColor.resolveWith((
                            states) => Colors.yellow),
                        overlayColor: MaterialStateProperty.resolveWith((
                            states) => Colors.transparent),
                      ),
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value ??
                                false; // Update the state of the checkbox
                          });
                        },
                      ),
                    ),
                    Expanded(child: Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Text(
                        "I would like to recieve your newsletter and other promotional information.",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.normal),),
                    ))
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color(0xFFd4b300)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    ),),
                  ),
                  onPressed: () async {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    UserCredential userCredential = await auth
                        .createUserWithEmailAndPassword(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    );

                    User? user = userCredential.user;
                    if (user != null) {
                      CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore.instance.collection("Users");
                      CollectionReference<Map<String, dynamic>> profileCollection = collection.doc(user.uid).collection("Profile");

                        // Add the data to the "Music collection
                        await profileCollection.doc(user.uid).set({
                          "Name": nameController.text.toString(),
                          "Email": emailController.text.toString(),
                          "Password": passwordController.text.toString(),
                        });
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen3(emailController.text.toString(), passwordController.text.toString()),),);
                    }

                  },
                  child: Text("Sign Up", style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              )
            ],
          ),

        ),
      ),
    );
  }


}