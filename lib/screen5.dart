

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musify_app/screen17.dart';
import 'package:musify_app/screen2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Screen5 extends StatefulWidget {

  var musicName;
  var musicUrl;

  Screen5(this.musicName, this.musicUrl);

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {

  var playlistNameController = TextEditingController();
  var descController = TextEditingController();

  bool _isChecked = false;

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

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
                  Container(
                      margin: EdgeInsets.only(top: 70, left: 15, right: 5),
                      child: FaIcon(Icons.menu, color: Colors.white, size: 40,)
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 70, left: 15, right: 30),
                    alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.yellow,
                          child: FaIcon(Icons.person, color: Color(0xFFd4b300), size: 40,))
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 15),
                alignment: Alignment.topLeft,
                child: Text("Playlist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35,),),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            margin: EdgeInsets.only(top: 40),
                            decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.all(Radius.circular(21)),
                            ),
                            child: Image.asset("assests/images/playlistmedium.png",),
                          ),
                          onTap: ()  {

                            playMusic();
                            // Navigator.push(context,
                            //   MaterialPageRoute(builder: (context) => Screen17(),),);
                          },
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Playlist 1", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Image.asset("assests/images/playlistmedium.png",),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Playlist 2", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Image.asset("assests/images/playlistmedium.png",),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Playlist 3", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 70, left: 15),
                alignment: Alignment.topLeft,
                child: Text("Artists", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35,),),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Image.asset("assests/images/playlist2medium.png",),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Artist 1", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Image.asset("assests/images/playlist2medium.png",),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Artist 2", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.all(Radius.circular(21)),
                          ),
                          child: Image.asset("assests/images/playlist2medium.png",),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("Artist 3", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.normal, fontSize: 20,),)
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Screen17(audioPlayer, widget.musicUrl)),);
                },
                child: Column(
                  children: [
                    Container(
                      height: 5,
                      margin: EdgeInsets.only(top: 80),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(31.0), topRight: Radius.circular(31.0)),
                        color: Color(0xFF503a19),
                      ),
                    ),
                Row(
                  children: [
                    Container(
                      height: 70,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(31.0), topRight: Radius.circular(31.0)),
                        color: Color(0xFF503a19),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(widget.musicName, style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.bold, fontSize: 18),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Container(
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: FaIcon(Icons.skip_previous, size: 35, color: Color(0xFFd4b300),),),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            setState(() {
                              isPlaying = !isPlaying;
                              if (isPlaying == false) {
                                audioPlayer.pause();
                              }
                              else {
                                audioPlayer.play();
                              }
                            });
                          }, icon: isPlaying ? FaIcon(Icons.pause, size: 35, color: Color(0xFFd4b300),) :  FaIcon(Icons.play_arrow, size: 35, color: Color(0xFFd4b300),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: FaIcon(Icons.skip_next, size: 35, color: Color(0xFFd4b300),),),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.topRight,
                      height: 70,
                      width: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(31.0), topRight: Radius.circular(31.0)),
                        color: Color(0xFF503a19),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 5,
                  color: Color(0xFF503a19),
                ),
                ],
                ),
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

  Future<void> playMusic() async {
    await audioPlayer.setUrl(widget.musicUrl);
    audioPlayer.play();
    print('Audio playing');
    setState(() {
      isPlaying = true;
    });

  }
}
