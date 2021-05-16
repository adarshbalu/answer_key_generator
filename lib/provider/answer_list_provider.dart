import 'package:answer_key_generator/models/answer.dart';
import 'package:flutter/cupertino.dart';

class AnswerListProvider extends ChangeNotifier {
  List<Answer> answerKeys = <Answer>[];

  void addAnswerKey(
      {@required String answer,
      @required int questionNumber,
      @required int marks}) {
    answerKeys.add(
        Answer(questionNumber: questionNumber, marks: marks, answer: answer));
    notifyListeners();
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

  Map<String, dynamic> convertToJSON() {
    return {'answer_key': answerKeys.map((e) => e.toJSON())};
  }
}
