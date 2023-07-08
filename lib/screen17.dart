

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musify_app/screen2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen17 extends StatefulWidget {

  var audioPlayerinstance;
  var audioUrl;
  Map<String, String> songDictionary;
  var playingSongCurrentIndex;

  Screen17(this.audioPlayerinstance, this.audioUrl, this.songDictionary, this.playingSongCurrentIndex);

  @override
  State<Screen17> createState() => _Screen17State();
}

class _Screen17State extends State<Screen17> {

  var playlistNameController = TextEditingController();
  var descController = TextEditingController();

  bool _isChecked = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  bool isPlaying = true;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();


    widget.audioPlayerinstance.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state == widget.audioPlayerinstance.PlayingState.PLAYING;
      });
    });

    widget.audioPlayerinstance.durationStream.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    widget.audioPlayerinstance.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.only(top: 100, left: 15, right: 15),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * (1/2 + 0.10),
                      margin: EdgeInsets.only(top: 100, left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.songDictionary.keys.elementAt(widget.playingSongCurrentIndex), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32,),),
                    ),
                    Spacer(),
                    Container(
                        margin: EdgeInsets.only(top: 100, left: 15, right: 30),
                        alignment: Alignment.topRight,
                            child: FaIcon(Icons.arrow_drop_down, color: Color(0xFFd4b300), size: 50,))
                  ],
                ),
              ),


              Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                alignment: Alignment.topLeft,
                child: Text("By Artist", style: TextStyle(color: Color(0xFFd4b300), fontWeight: FontWeight.bold, fontSize: 20,),),
              ),


              Container(
                margin: EdgeInsets.only(top: 30),
                child: Image.asset("assests/images/despacitofull.png"),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                          IconButton(onPressed: () async {
                            widget.playingSongCurrentIndex--;
                            if (widget.playingSongCurrentIndex < 0) {
                              widget.playingSongCurrentIndex = widget.songDictionary.length - 1;
                            }
                            await widget.audioPlayerinstance.setUrl(widget.songDictionary.values.elementAt(widget.playingSongCurrentIndex));
                            widget.audioPlayerinstance.play();
                            print('Audio playing');
                            setState(() {
                              isPlaying = true;
                            });
                          }, icon: FaIcon(Icons.skip_previous, size: 50, color: Color(0xFFd4b300),),),
                          IconButton(onPressed: () {
                            setState(() {
                              isPlaying = !isPlaying;
                              if (isPlaying == false) {
                                widget.audioPlayerinstance.pause();
                              }
                              else {
                                widget.audioPlayerinstance.play();
                              }
                            });

                          }, icon: isPlaying ? FaIcon(Icons.pause, size: 50, color: Color(0xFFd4b300),) : FaIcon(Icons.play_arrow, size: 50, color: Color(0xFFd4b300),)),
                          IconButton(onPressed: () async {
                            widget.playingSongCurrentIndex++;
                            if (widget.playingSongCurrentIndex >= widget.songDictionary.length) {
                              widget.playingSongCurrentIndex = 0;
                            }
                            await widget.audioPlayerinstance.setUrl(widget.songDictionary.values.elementAt(widget.playingSongCurrentIndex));
                            widget.audioPlayerinstance.play();
                            print('Audio playing');
                            setState(() {
                              isPlaying = true;
                            });
                          }, icon: FaIcon(Icons.skip_next, size: 50, color: Color(0xFFd4b300),),),
                        ],
                ),
              ),


              Container(
                width: MediaQuery.of(context).size.width * (3/4 + 0.15),
                margin: EdgeInsets.only(top: 30),
                child: Slider(
                  activeColor: Color(0xFFd4b300),
                  inactiveColor: Color(0xFF503a19),
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt(),);
                    widget.audioPlayerinstance.seek(position);
                    widget.audioPlayerinstance.resume();
                  },
                ),
              ),



              Container(
                width: MediaQuery.of(context).size.width * (3/4),
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  formatTime(position.inSeconds), style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.normal, fontSize: 16),),
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

  String formatTime(int seconds) {
    int minutes = (seconds/60).floor();
    int remainingSeconds = seconds % 60;
    
    
    return '$minutes:${remainingSeconds.toString().padLeft(2,'0')}';
  }
}
