import 'package:flutter/material.dart';
import 'dart:math' as math;
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.green,
        child: const Center(
          child: Text('Whee!'),
        ),
      ),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        );
      },
    );
  }
}











class MyApp3 extends StatelessWidget {
  const MyApp3({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlert(context));
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'PressStart',
      ),
      home: MyApp(),
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

class MyAp extends StatefulWidget {
@override
State<StatefulWidget> createState() {
	return _MyApState();
}
}

class _MyApState extends State<MyAp> {
final _questions = const [
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
];

var _questionIndex = 0;
var _totalScore = 0;

void _resetQuiz() {
	setState(() {
	_questionIndex = 0;
	_totalScore = 0;
	});
}

void _answerQuestion(int score) {
	_totalScore += score;

	setState(() {
	_questionIndex = _questionIndex + 1;
	});
	print(_questionIndex);
	if (_questionIndex < _questions.length) {
	print('We have more questions!');
	} else {
	print('No more questions!');
	}
}

@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: Scaffold(
		appBar: AppBar(
		title: Text('Geeks for Geeks'),
		backgroundColor: Color(0xFF00E676),
		),
		body: Padding(
		padding: const EdgeInsets.all(30.0),
		child: _questionIndex < _questions.length
			? Quiz(
				answerQuestion: _answerQuestion,
				questionIndex: _questionIndex,
				questions: _questions,
				) //Quiz
			: Result(_totalScore, _resetQuiz),
		), //Padding
	), //Scaffold
	debugShowCheckedModeBanner: false,
	); //MaterialApp
}
}






class Quiz extends StatelessWidget {
final List<Map<String, Object>> questions;
final int questionIndex;
final Function answerQuestion;

Quiz({
	required this.questions,
	required this.answerQuestion,
	required this.questionIndex,
});

@override
Widget build(BuildContext context) {
	return Column(
	children: [
		Question( "" ), //Question
		...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
			.map((answer) {
		return Answer(() => answerQuestion(answer['score']), "" );
		}).toList()
	],
	); //Column
}
}






class Question extends StatelessWidget {
final String questionText;

Question(this.questionText);

@override
Widget build(BuildContext context) {
	return Container(
	width: double.infinity,
	margin: EdgeInsets.all(10),
	child: Text(
		questionText,
		style: TextStyle(fontSize: 28),
		textAlign: TextAlign.center,
	), //Text
	); //Contaier
}
}





class Answer extends StatelessWidget {
final Function selectHandler;
final String answerText;

Answer(this.selectHandler, this.answerText);

@override
Widget build(BuildContext context) {
	return Container(
	width: double.infinity,
	child: ElevatedButton(
    onPressed: ()=> selectHandler, 
    child: Text(answerText),
    )
	); //Container
}
}







class Result extends StatelessWidget {
final int resultScore;
final Function resetHandler;

Result(this.resultScore, this.resetHandler);

//Remark Logic
String get resultPhrase {
	String resultText;
	if (resultScore >= 41) {
	resultText = 'You are awesome!';
	print(resultScore);
	} else if (resultScore >= 31) {
	resultText = 'Pretty likeable!';
	print(resultScore);
	} else if (resultScore >= 21) {
	resultText = 'You need to work more!';
	} else if (resultScore >= 1) {
	resultText = 'You need to work hard!';
	} else {
	resultText = 'This is a poor score!';
	print(resultScore);
	}
	return resultText;
}
@override
Widget build(BuildContext context) {
	return Center(
	child: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: <Widget>[
		Text(
			resultPhrase,
			style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
			textAlign: TextAlign.center,
		), //Text
		Text(
			'Score ' '$resultScore',
			style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
			textAlign: TextAlign.center,
		), //Text
		ElevatedButton(
      onPressed: ()=> resetHandler, 
      child: Text(
			'Restart Quiz!',
			),)//FlatButton
		], //<Widget>[]
	), //Column
	); //Center
}
}