import 'package:answer_key_generator/models/answer.dart';
import 'package:answer_key_generator/provider/answer_list_provider.dart';
import 'package:answer_key_generator/ui/edit_answer_key.dart';
import 'package:answer_key_generator/utils/json_convertor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Answer key Generator'),
        ),
        centerTitle: false,
        actions: [
          ElevatedButton(
            onPressed: () {
              if (context.read<AnswerListProvider>().answerKeys.isNotEmpty)
                writeFile(context.read<AnswerListProvider>().toJson());
              else
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('Please add answers to continue'),
                  duration: const Duration(seconds: 5),
                ));
            },
            child: Icon(Icons.done),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditAnswerKey(
                        answer: Answer(marks: 0, questionNumber: 0, answer: ''),
                      )));
        },
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Consumer<AnswerListProvider>(
          builder: (_, provider, child) {
            if (provider.answerKeys.isNotEmpty)
              return ListView.builder(
                itemCount: provider.answerKeys.length,
                itemBuilder: (_, index) => AnswerTile(
                  answer: provider.answerKeys[index],
                ),
              );
            else
              return Center(
                child: Text('No answers added'),
              );
          },
        ),
      ),
    );
  }
}

class AnswerTile extends StatelessWidget {
  final Answer answer;
  const AnswerTile({
    Key key,
    this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // onTap: () {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => EditAnswerKey(
      //                 answer: answer,
      //               )));
      // },
      onLongPress: () {
        context
            .read<AnswerListProvider>()
            .removeAnswerKey(answer.questionNumber);
      },
      leading: CircleAvatar(
        child: Text(answer.questionNumber.toString()),
      ),
      title: Text(answer.answer),
      subtitle: Text(answer.marks.toString() + ' marks'),
    );
  }
}
