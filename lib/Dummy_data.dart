// ignore: file_names


// import 'dart:ffi';
// Exams s......
class Exam {
  Exam({
    required this.id,
    required this.name,
  });
  int id = 0;
  String name = "";
}



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









