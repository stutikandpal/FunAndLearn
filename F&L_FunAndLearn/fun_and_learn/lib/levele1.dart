import 'package:flutter/material.dart';
import 'package:fun_and_learn/levele2.dart';
import 'dart:math';
import 'index.dart';

class MyApp1 extends StatelessWidget {
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
    title: const Text('Level 1'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Drag the states and Drop on the languages spoken there.",),
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
    '👳‍♀️Rajasthan': 'Marwadi',
    '😌Assam':'Assamese',
    '🧕🏼Bengal':'Bengali',
    '👳🏼‍♂️Punjab':'Punjabi',
    '🧓🏽Odisha': 'Odia',
    '🧑🏻Telangana': 'Telugu'
  };
  int count=0;
  int seed = 0;
  



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
          });
        },
      ),
      
      body: 
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
            child: Text('✅', style:TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold) ,),
            alignment: Alignment.center,
            height: 60,
            width: 145,
            margin: EdgeInsets.all(15)
          );
        }
         else {
          return Container(color: Colors.orange, height: 60, width: 145, alignment: Alignment.center ,margin: EdgeInsets.all(15), child: Text(choices[emoji], 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          );
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
      color: Colors.lightBlue[400],
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: 180,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(15),
        child: Text(
          emoji,
          style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
        ),
        
      ),
    );
  }
}
Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Congratulations!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Thank you for helping me complete Level 1!! 🤩🤩 \n \n See my gift, Gloves. 🧤 \n \n These will keep my hands warm!! ❤️❤️", 
        style: TextStyle(fontWeight: FontWeight.bold),),
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
              MaterialPageRoute(builder: (context) => MyApp2()),
            );
          },
        child: const Text('Next Level'),
      ),
    ],
  );
}
