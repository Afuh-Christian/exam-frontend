// ignore: file_names


import 'dart:ffi';
// Exams s......
class Exam {
  Exam({
    required this.id,
    required this.name,
  });
  int id = 0;
  String name = "";
}


// List<Exam> examsList = [
//   Exam(id: 1, name: "gce o levels"),
// Exam(id: 2, name: "gce a levels"),
// Exam(id: 3, name: "probatio"),
// Exam(id: 4, name: "ens"),
// Exam(id: 5, name: "ens lan"),
// Exam(id: 6, name: "ens question"),
// ];


// Subjects ..............
class Subject {
  Subject({
    required this.id,
    required this.name,
    required this.examID,
  });
   int id = 0;
   int examID = 0;
   String name = "";
}





class Topic {
  Topic({
    required this.id,
    required this.name,
    required this.subjectID,
  });
   int id = 0;
   int subjectID = 0;
   String name = "";
}



// List<Subject> subjects = [
// Subject(id: 1, name: "O Physics", examID: 1 ),
// Subject(id: 2, name: "O Chemistry", examID: 1 ),
// Subject(id: 3, name: "O Biology", examID: 1 ),
// Subject(id: 3, name: "O maths", examID: 1 ),
// Subject(id: 4, name: "A Maths ", examID: 2 ),
// Subject(id: 5, name: "A Chem", examID: 2 ),
// Subject(id: 6, name: "A Bio", examID: 2 ),
// Subject(id: 7, name: "A Literature", examID: 2 ),
// Subject(id: 8, name: "P english", examID: 3 ),
// Subject(id: 9, name: "P Electronics", examID: 3 ),
// Subject(id: 10, name: "P French", examID: 3 ),
// Subject(id: 11, name: "P Manual machanics", examID: 3 ),
// Subject(id: 12, name: "E History", examID: 4 ),
// Subject(id: 13, name: "E English", examID: 4 ),
// Subject(id: 14, name: "E history", examID: 4 ),
// Subject(id: 15, name: "E maths", examID: 4 ),
// ];







