


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musify_app/screen10.dart';
import 'package:musify_app/screen2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musify_app/screen5.dart';

class Screen9 extends StatefulWidget {


  File mp3File;
  String mp3FileName, mp3FilePath, titleOfMusic, genreOfMusic, descOfMusic;

  Screen9(this.mp3File, this.mp3FileName, this.mp3FilePath, this.titleOfMusic, this.genreOfMusic, this.descOfMusic);

  @override
  State<Screen9> createState() => _Screen9State();
}

class _Screen9State extends State<Screen9> {

  var playlistNameController = TextEditingController();
  var descController = TextEditingController();

  bool _isChecked = false;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.only(top: 50, left: 15, right: 5),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        margin: EdgeInsets.only(top: 70, left: 15, right: 5),
                        child: FaIcon(Icons.arrow_back, color: Colors.white, size: 40,),
                    ),
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen10("", ""),),);
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 70, left: 15, right: 5),
                      child: Text("Add Playlist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32,),)
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color(0xFF503a19),
                  borderRadius: BorderRadius.all(Radius.circular(21)),
                ),
                child: Image.asset("assests/images/upload.png",),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 15, right: 10),
                      child: TextField(
                        controller: playlistNameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Playlist Name",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15, right: 10),
                      child: TextField(
                        controller: descController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 100, left: 10),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Description",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    margin: EdgeInsets.only(top: 50, right: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFd4b300)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),),
                      ),
                      onPressed: () async {

                        FirebaseAuth auth = FirebaseAuth.instance;
                        User? user = auth.currentUser;

                        Reference storageRef = FirebaseStorage.instance.ref().child('${user?.uid}/${playlistNameController.text.toString()}/mp3s/${widget.mp3FileName}');
                        UploadTask uploadTask = storageRef.putFile(widget.mp3File);

                        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
                        String downloadUrl = await taskSnapshot.ref.getDownloadURL();


                        if (user != null) {
                          CollectionReference<Map<String, dynamic>> collection = FirebaseFirestore.instance.collection("Users");
                          CollectionReference<Map<String, dynamic>> profileCollection = collection.doc(user.uid).collection("Profile");

                          DocumentSnapshot<Map<String, dynamic>> snapshot = await profileCollection.doc(user.uid).get();

                          if (snapshot.exists) {
                            Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;


                            CollectionReference<Map<String, dynamic>> musicCollection = collection.doc(user.uid).collection("Playlist");


                            // Add the data to the "Music collection
                            await musicCollection.doc(playlistNameController.text.toString()).set({
                              "Title": widget.titleOfMusic,
                              "Genre": widget.genreOfMusic,
                              "Description": widget.descOfMusic,
                            });

                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Screen5(widget.mp3FileName, widget.mp3FilePath, playlistNameController.text.toString(), descController.text.toString()),),);
                          }
                        }

                      },
                      child: Text("Add Playlist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF2a2730),
        unselectedItemColor: Color(0xFFd4b300),
        selectedItemColor: Color(0xFFd4b300),
        unselectedFontSize: 15,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.heart_broken),
            label: "Liked",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: FaIcon(Icons.watch_later_outlined),
            label: "Listen Later",
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: 35,
      ),
    );
  }
}
