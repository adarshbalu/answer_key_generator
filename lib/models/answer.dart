import 'package:flutter/cupertino.dart';

class Answer {
  String answer;
  int questionNumber, marks = 0;

  Answer(
      {@required this.answer,
      @required this.questionNumber,
      @required this.marks})
      : assert(
          questionNumber != null,
          answer != null,
        );
}
