import 'package:answer_key_generator/models/answer.dart';
import 'package:answer_key_generator/provider/answer_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditAnswerKey extends StatefulWidget {
  final Answer answer;
  const EditAnswerKey({Key key, this.answer}) : super(key: key);

  @override
  _EditAnswerKeyState createState() => _EditAnswerKeyState();
}

class _EditAnswerKeyState extends State<EditAnswerKey> {
  TextEditingController number, answer, mark;
  GlobalKey<FormState> key;
  @override
  void initState() {
    super.initState();
    key = GlobalKey<FormState>();
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
        child: Form(
          key: key,
          child: ListView(
            children: [
              TextFormField(
                controller: answer,
                maxLength: 10,
                maxLines: 10,
                validator: (v) {
                  if (v == null || v.isEmpty)
                    return 'Add answer';
                  else
                    return null;
                },
                keyboardType: TextInputType.text,
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
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (v) {
                        try {
                          if (v == null || int.tryParse(v) <= 0)
                            return 'Add question number';
                          else
                            return null;
                        } catch (e) {
                          return 'Wrong input';
                        }
                      },
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      validator: (v) {
                        try {
                          if (v == null || int.tryParse(v) <= 0)
                            return 'Add marks';
                          else
                            return null;
                        } catch (e) {
                          return 'Wrong input';
                        }
                      },
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
                    if (key.currentState.validate()) {
                      context.read<AnswerListProvider>().addAnswerKey(
                          answer: answer.text,
                          questionNumber: int.parse(number.text),
                          marks: int.parse(mark.text));
                      Navigator.pop(context);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
