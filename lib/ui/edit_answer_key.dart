import 'package:answer_key_generator/models/answer.dart';
import 'package:flutter/material.dart';

class EditAnswerKey extends StatefulWidget {
  final Answer answer;
  const EditAnswerKey({Key key, this.answer}) : super(key: key);

  @override
  _EditAnswerKeyState createState() => _EditAnswerKeyState();
}

class _EditAnswerKeyState extends State<EditAnswerKey> {
  TextEditingController number, answer, mark;
  @override
  void initState() {
    super.initState();
    number =
        TextEditingController(text: widget.answer.questionNumber.toString());
    mark = TextEditingController(text: widget.answer.marks.toString());
    answer = TextEditingController(text: widget.answer.answer.toString());
  }

  @override
  void dispose() {
    number.dispose();
    mark.dispose();
    answer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit answer'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: answer,
              maxLength: 10,
              maxLines: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(),
                  hintText: 'Answer ',
                  helperText: 'Answer'),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: 'Question Number ',
                        helperText: 'Number'),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: mark,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(),
                        hintText: 'Marks ',
                        helperText: 'Marks'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            ElevatedButton(
                child: Text('Save'),
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
