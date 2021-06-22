import 'package:flutter/material.dart';
import 'package:fun_and_learn/index.dart';
class Story extends StatelessWidget {
  const Story({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: Container( 
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/India.jpg"), fit: BoxFit.cover)),
      child: MyStatefulWidgetStory(),
      )
    );
  }
}

class MyStatefulWidgetStory extends StatefulWidget {
  const MyStatefulWidgetStory({ Key? key }) : super(key: key);

  @override
  _MyStatefulWidgetStoryState createState() => _MyStatefulWidgetStoryState();
}

class _MyStatefulWidgetStoryState extends State<MyStatefulWidgetStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text('Fun and Learn'),
          backgroundColor: Colors.pink),
          floatingActionButton: ElevatedButton(
        child: Text("Help Bharat"),
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
      ),
      
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(color: Colors.orange, height: 50, width: 350, alignment: Alignment.center ,margin: EdgeInsets.all(5), 
        child: Text("Hello, I am Bharat. 🙏🏻🙋🏻‍♂️", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          ),
                Container(color: Colors.green, height: 100, width: 350, alignment: Alignment.center ,margin: EdgeInsets.all(5), 
        child: Text("⛄🗻I want to climb the highest mountain in India,Kangchenjunga.", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          ),
          Container(color: Colors.orange, height: 80, width: 350, alignment: Alignment.center ,margin: EdgeInsets.all(5), 
        child: Text("But I don't have the things required to go there! 😒😭", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          ),
          Container(color: Colors.green, height: 70, width: 350, alignment: Alignment.center ,margin: EdgeInsets.all(5), 
        child: Text("👩🏻😍Mom says, I will get 1 gift on passing 1 level.", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          ),
          Container(color: Colors.orange, height: 90, width: 350, alignment: Alignment.center ,margin: EdgeInsets.all(5), 
        child: Text("Please help me pass all the levels so that I can climb Mount Everest!! 😆🙏🏻", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), textAlign: TextAlign.center,),
          ),

              ]

          ),
          
        ],
      )
        

          
                   
    
    );
  }
}