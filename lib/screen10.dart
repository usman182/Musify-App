


import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify_app/screen2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musify_app/screen3.dart';
import 'package:musify_app/screen5.dart';
import 'package:musify_app/screen9.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Screen10 extends StatefulWidget {

  String emailFromSignUp;
  String passwordFromSignUp;

  Screen10(this.emailFromSignUp, this.passwordFromSignUp);

  @override
  State<Screen10> createState() => _Screen10State();
}

class _Screen10State extends State<Screen10> {

  var titleController = TextEditingController();

  var genreController = TextEditingController();

  var descController = TextEditingController();

  bool _isChecked = false;
  String SONG = "";
  String SONGPATH = "";

  late File mp3File;
  String mp3FileName = "";
  String mp3FilePath = "";

  late PlatformFile file;

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
                        MaterialPageRoute(builder: (context) => Screen3(widget.emailFromSignUp, widget.emailFromSignUp),),);
                    },
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 70, left: 15, right: 5),
                      child: Text("Upload Music", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32,),)
                  ),
                  Spacer(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      margin: EdgeInsets.only(top: 70, left: 15, right: 15),
                      alignment: Alignment.topRight,
                      child: Text("Next", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.bold, fontSize: 18,),),
                    ),
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Screen9(mp3File, mp3FileName, mp3FilePath, titleController.text.toString(), genreController.text.toString(), descController.text.toString()),),);
                    },
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
                child: GestureDetector(
                    child: Image.asset("assests/images/upload.png",),
                onTap: () async {
                  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);

                  if (result != null) {
                    file = result.files.first;

                    mp3File = File(file.path!);
                    mp3FileName = file.name;
                    mp3FilePath = mp3File.path;

                  }
                },),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 15, right: 5),
                      child: TextField(
                        controller: titleController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Title",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15, right: 5),
                      child: TextField(
                        controller: genreController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Genre",
                            hintStyle: TextStyle(color: Color(0xFFd4b300)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide.none,
                            )
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 25, left: 15, right: 5),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 150,
                    height: 60,
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFd4b300)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screen9(mp3File, mp3FileName, mp3FilePath, titleController.text.toString(), genreController.text.toString(), descController.text.toString()),),);
                      },
                      child: Text("Upload", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 60,
                    margin: EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),),
                      ),
                      onPressed: () {},
                      child: Text("Record", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),
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
