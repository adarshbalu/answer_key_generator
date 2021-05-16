import 'package:answer_key_generator/models/answer.dart';
import 'package:flutter/cupertino.dart';

class AnswerListProvider extends ChangeNotifier {
  List<Answer> answerKeys = <Answer>[];

  bool addAnswerKey(
      {@required String answer,
      @required int questionNumber,
      @required int marks}) {
    bool isFound = false;
    answerKeys.forEach((element) {
      if (element.questionNumber == questionNumber) isFound = true;
    });
    if (!isFound) {
      answerKeys.add(
          Answer(questionNumber: questionNumber, marks: marks, answer: answer));
      notifyListeners();
      return true;
    } else
      return false;
  }

  void removeAnswerKey(int questionNumber) {
    answerKeys.removeWhere((element) {
      return element.questionNumber == questionNumber;
    });
    notifyListeners();
  }

  bool checkIfQuestionPresent(int questionNumber) {
    answerKeys.forEach((element) {
      if (element.questionNumber == questionNumber) {
        return true;
      }
    });
    return false;
  }

  void editAnswer(
      {@required int questionNumber,
      @required int marks,
      @required String answer}) {
    answerKeys.forEach((element) {
      if (element.questionNumber == questionNumber) {
        element.marks = marks;
        element.answer = answer;
        notifyListeners();
        return;
      }
    });
  }

  Map<String, dynamic> toJson() => {
        "answer_key": List<dynamic>.from(answerKeys.map((x) => x.toJSON())),
      };
}
