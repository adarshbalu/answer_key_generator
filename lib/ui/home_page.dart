import 'package:answer_key_generator/models/answer.dart';
import 'package:answer_key_generator/ui/edit_answer_key.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Answer key Generator'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => EditAnswerKey(
                        answer: Answer(marks: 0, questionNumber: 0, answer: ''),
                      )));
        },
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
