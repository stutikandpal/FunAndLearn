//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fun_and_learn/index.dart';
//import 'package:fun_and_learn/levele1.dart';
import 'package:fun_and_learn/levele3.dart';
import 'dart:math';
import 'index.dart';
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: ColorGame(),
    );
  }
  void showAlert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
    title: const Text('Level 2'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Drag the crops and drop on the states they are grown most/best in.",),
      ],
    ),
    actions: <Widget>[
      new ElevatedButton(
        onPressed: () => Navigator.pop(context, 'Start'),
        child: const Text('Start'),
      ),
    ],
  ));
    }
}
class ColorGame extends StatefulWidget {
  ColorGame({ Key? key }) : super(key: key);
  createState() => ColorGameState();
}
class ColorGameState extends State<ColorGame> {
  final Map<String, bool> score = {};
  final Map choices = {
    '🌻 Sunflower':'Karnataka',
    '🍎Apple':'Himachal Pradesh',
    '🌾Wheat':'Madhya Pradesh',
    '🥔Potato':'Uttar Pradesh',
    '🌶️Chilli':'Andhra Pradesh',
    '🌽Maize':'Maharashtra'
  };
  int count=0;
  int seed = 0;
  //AudioCache _audiocontroller = AudioCache();
  //AudioCache _audioController = AudioCache();
  //AudioPlayer audioplayer = AudioPlayer();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Score ${score.length} / 6'),
          backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            score.clear();
            seed++;
            count=0;
          });
        },
      ),
      body: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: choices.keys.map((emoji) {
                return Draggable<String>(
                  data: emoji,
                  child: Emoji(emoji: score[emoji] == true ? '✅' : emoji),
                  feedback: Emoji(emoji: emoji),
                  childWhenDragging: Emoji(emoji: '🌱'),
                );
              }).toList()),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
                choices.keys.map((emoji) => _buildDragTarget(emoji)).toList()
                  ..shuffle(Random(seed)),
          )
        ],
      ),
    );
  }
  Widget _buildDragTarget(emoji) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String?> incoming, List rejected) {
        if (score[emoji] == true) {
          return Container(
            color: Colors.green,
            child: Text('Correct!'),
            alignment: Alignment.center,
            height: 80,
            width: 180,
          );
        }
         else {
          return Container(color: Colors.indigo, height: 80, width: 180 , alignment: Alignment.center, child: Text(choices[emoji], style: TextStyle(  color: Colors.white, fontSize: 25,  ),),);
        }
      },
      onWillAccept: (data) => data == emoji,
      onAccept: (data) {
        setState(() {
          score[emoji] = true;
          count++;
          if ( count == 6){
            count=0;
            showDialog(context: context, builder: (BuildContext context) => _buildPopupDialog(context));
          }
        });
        //_audioController.play('audios/Success.mp3');
        //audioplayer.play('audios/Success.mp3');
        //_audioController.play('audios/Success.mp3');
      },
      onLeave: (data) {},
    );
  }
}
class Emoji extends StatelessWidget {
  Emoji({ Key? key , required this.emoji }) : super(key: key);
  final String emoji;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lime,
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: 170,
        padding: EdgeInsets.all(10),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Congratulations!!'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Level 2 Completed",),
      ],
    ),
    actions: <Widget>[

      new ElevatedButton(onPressed: 
      () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
       child: const Text('Go to Home'), 
       style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),),


      new ElevatedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp3()),
            );
          },
        child: const Text('Next Level'),
      ),
      
    ],
  );
}