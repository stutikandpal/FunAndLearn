import 'package:flutter/material.dart';
import 'package:fun_and_learn/levele2.dart';
import 'package:fun_and_learn/levele1.dart';
import 'package:fun_and_learn/levele3.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

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
      child: MyStatefulWidget(),
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({ Key? key }) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: Text('Fun and Learn'),
          backgroundColor: Colors.pink),
      
      body: 
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new ElevatedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp1()),
            );
          },
        child: const Text('Level 1'),
      ),

      new ElevatedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp3()),
            );
          },
        child: const Text('Level 3'),
      ),
              ] 
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              new ElevatedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp2()),
            );
          },
        child: const Text('Level 2'),
      ),

      new ElevatedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp2()),
            );
          },
        child: const Text('Level 4'),
      ),
            ]
                
          )
        ],
      ),
    );
  }
}