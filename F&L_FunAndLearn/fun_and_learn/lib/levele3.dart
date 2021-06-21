import 'package:flutter/material.dart';
class MyApp3 extends StatelessWidget {
  const MyApp3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: Game(),
    );
  }

  void showAlert(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
    title: const Text('Level 3'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Select the correct option.",),
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

class Game extends StatefulWidget {
  const Game({ Key? key }) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  final Map<String, bool> score = {};
  final  questions =  {
	{
	'questionText': ' Who created Flutter?',
	'answers': [
		{'text': 'Facebook', 'score': -2},
		{'text': 'Adobe', 'score': -2},
		{'text': 'Google', 'score': 10},
		{'text': 'Microsoft', 'score': -2},
	],
	},
	{
	'questionText': ' What is Flutter?',
	'answers': [
		{'text': 'Android Development Kit', 'score': -2},
		{'text': 'IOS Development Kit', 'score': -2},
		{'text': 'Web Development Kit', 'score': -2},
		{
		'text':
			'SDK to build beautiful IOS, Android, Web & Desktop Native Apps',
		'score': 10
		},
	],
	},
	{
	'questionText': '  Which programing language is used by Flutter',
	'answers': [
		{'text': 'Ruby', 'score': -2},
		{'text': 'Dart', 'score': 10},
		{'text': 'C++', 'score': -2},
		{'text': 'Kotlin', 'score': -2},
	],
	},
	{
	'questionText': ' Who created Dart programing language?',
	'answers': [
		{'text': 'Lars Bak and Kasper Lund', 'score': 10},
		{'text': 'Brendan Eich', 'score': -2},
		{'text': 'Bjarne Stroustrup', 'score': -2},
		{'text': 'Jeremy Ashkenas', 'score': -2},
	],
	},
	{
	'questionText':
		' Is Flutter for Web and Desktop available in stable version?',
	'answers': [
		{
		'text': 'Yes',
		'score': -2,
		},
		{'text': 'No', 'score': 10},
	],
	},
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
      
      body: Text("hi")
      
    );
  }
}