import 'package:flutter/material.dart';

import '../Dummy_data.dart';

class ExamProvider extends ChangeNotifier {
  List<Exam> examsList = [
    Exam(id: 1, name: "gce o levels"),
    Exam(id: 2, name: "gce a levels"),
    Exam(id: 3, name: "probatio"),
    Exam(id: 4, name: "ens"),
    Exam(id: 5, name: "ens lan"),
    Exam(id: 6, name: "ens question"),
    Exam(id: 7, name: "ens adsfasfdad question"),
  ];

  List<Exam> getExamList() => examsList;

  String choosenExamname = "";

  int getChoosenExamID() {
    var filetered =
        examsList.where((element) => element.name == choosenExamname).toList();

    return filetered.isEmpty ? 0 : filetered[0].id;
  }

  void setChoosenExamName(String value) {
    choosenExamname = value;
    choosenSubject = "";
    choosenTopic = "";
    notifyListeners();
  }

  List<Subject> subjects = [
    Subject(id: 1, name: "O Physics", examID: 1),
    Subject(id: 2, name: "O Biology", examID: 1),
    Subject(id: 3, name: "O Chemistory", examID: 1),
    Subject(id: 16, name: "O maths", examID: 1),
    Subject(id: 4, name: "A Maths", examID: 2),
    Subject(id: 5, name: "A Chem", examID: 2),
    Subject(id: 6, name: "A Bio", examID: 2),
    Subject(id: 7, name: "A Literature", examID: 2),
    Subject(id: 8, name: "P english", examID: 3),
    Subject(id: 9, name: "P Electronics", examID: 3),
    Subject(id: 10, name: "P French", examID: 3),
    Subject(id: 11, name: "P Manual machanics", examID: 3),
    Subject(id: 12, name: "E History", examID: 4),
    Subject(id: 13, name: "E English", examID: 4),
    Subject(id: 14, name: "E history", examID: 4),
    Subject(id: 15, name: "E maths", examID: 4),
  ];

  List<Subject> getSubjectList() {
    List<Subject> subjectlist = subjects
        .where((element) => element.examID == getChoosenExamID())
        .toList();

    if (subjectlist.isEmpty) {
      return [Subject(id: 0, name: "No items", examID: -1)];
    } else {
      return subjectlist;
    }
  }

  String choosenSubject = "";

  int getChoosenSubjectID() {
    var filetered = getSubjectList()
        .where((element) => element.name == choosenSubject)
        .toList();

    if (filetered.isEmpty) return 0;
    return filetered[0].id;
  }

  void setChoosenSubjectName(String value) {
    choosenSubject = value;
     choosenTopic = "";
    notifyListeners();
  }

  List<Topic> topics = [
    // O level physics
    Topic(id: 1, name: "O mechanics", subjectID: 1),
    Topic(id: 2, name: "O Optics", subjectID: 1),
    Topic(id: 3, name: "O Electrostatics", subjectID: 1),
    Topic(id: 4, name: "O simple harmonic motion", subjectID: 1),
    Topic(id: 5, name: "O waves", subjectID: 1),

    // O level biology
    Topic(id: 6, name: "O biology1", subjectID: 2),
    Topic(id: 7, name: "O biology2", subjectID: 2),
    Topic(id: 8, name: "O biology3", subjectID: 2),
    Topic(id: 9, name: "O biology4", subjectID: 2),
    Topic(id: 10, name: "O biology5", subjectID: 2),

    // O level chemistory
    Topic(id: 11, name: "O Chem1", subjectID: 3),
    Topic(id: 12, name: "O Chem2", subjectID: 3),
    Topic(id: 13, name: "O Chem3", subjectID: 3),
    Topic(id: 14, name: "O Chem4", subjectID: 3),
    Topic(id: 15, name: "O Chem5", subjectID: 3),

    // A level Maths .......
    Topic(id: 16, name: "A Maths1 ", subjectID: 4),
    Topic(id: 17, name: "A Maths2 ", subjectID: 4),
    Topic(id: 18, name: "A Maths3 ", subjectID: 4),
    Topic(id: 19, name: "A Maths4 ", subjectID: 4),
    Topic(id: 20, name: "A Maths5 ", subjectID: 4),

    Topic(id: 21, name: "A Chem1", subjectID: 5),
    Topic(id: 22, name: "A Chem2", subjectID: 5),
    Topic(id: 23, name: "A Chem3", subjectID: 5),
    Topic(id: 24, name: "A Chem4", subjectID: 5),
    Topic(id: 25, name: "A Chem5", subjectID: 5),

    // Topic(id: 6, name: "A Bio", subjectID: 2),
    Topic(id: 26, name: "A Literature1", subjectID: 7),
    Topic(id: 27, name: "A Literature2", subjectID: 7),
    Topic(id: 28, name: "A Literature3", subjectID: 7),
    Topic(id: 29, name: "A Literature4", subjectID: 7),
    Topic(id: 30, name: "A Literature5", subjectID: 7),
    Topic(id: 31, name: "A Literature6", subjectID: 7),
    Topic(id: 32, name: "A Literature7", subjectID: 7),

    // Topic(id: 8, name: "P english", subjectID: 3),

    Topic(id: 33, name: "P Electronics1", subjectID: 9),
    Topic(id: 34, name: "P Electronics2", subjectID: 9),
    Topic(id: 35, name: "P Electronics3", subjectID: 9),
    Topic(id: 36, name: "P Electronics4", subjectID: 9),
    Topic(id: 37, name: "P Electronics5", subjectID: 9),

    Topic(id: 38, name: "P French1", subjectID: 10),
    Topic(id: 39, name: "P French2", subjectID: 10),
    Topic(id: 40, name: "P French3", subjectID: 10),
    Topic(id: 41, name: "P French4", subjectID: 10),
    Topic(id: 42, name: "P French5", subjectID: 10),

    // Topic(id: 11, name: "P Manual machanics", subjectID: 3),
    Topic(id: 43, name: "E History1", subjectID: 12),
    Topic(id: 44, name: "E History2", subjectID: 12),
    Topic(id: 45, name: "E History3", subjectID: 12),
    Topic(id: 46, name: "E History4", subjectID: 12),
    Topic(id: 47, name: "E History5", subjectID: 12),

    Topic(id: 48, name: "E English1", subjectID: 13),
    Topic(id: 49, name: "E English2", subjectID: 13),
    Topic(id: 50, name: "E English3", subjectID: 13),
    Topic(id: 51, name: "E English4", subjectID: 13),
    Topic(id: 52, name: "E English5", subjectID: 13),
    Topic(id: 53, name: "E English6", subjectID: 13),
    // Topic(id: 14, name: "E history", subjectID: 4),

    Topic(id: 54, name: "E maths1", subjectID: 15),
    Topic(id: 55, name: "E maths2", subjectID: 15),
    Topic(id: 56, name: "E maths3", subjectID: 15),
    Topic(id: 57, name: "E maths4", subjectID: 15),
    Topic(id: 58, name: "E maths5", subjectID: 15),
    Topic(id: 59, name: "E maths6", subjectID: 15),
  ];

  List<Topic> getTopicList() {
    List<Topic> topiclist = topics
        .where((element) => element.subjectID == getChoosenSubjectID())
        .toList();

    if (topiclist.isEmpty) {
      return [Topic(id: 0, name: "No items", subjectID: -1)];
    } else {
      return topiclist;
    }
  }

  String choosenTopic = "";

  int getChoosenTopicID() {
    var filetered = getTopicList()
        .where((element) => element.name == choosenTopic)
        .toList();
    return filetered[0].id;
  }

  void setChoosenTopicName(String value) {
    choosenTopic = value;
    notifyListeners();
  }

  int _numberOfLikes = 0;

  int get_numberOfLikes() => _numberOfLikes;

  void set_numberOfLikes() {
    _numberOfLikes++;
    notifyListeners(); // To listen for the change ..
  }
}
