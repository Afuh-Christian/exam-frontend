class Question {
  final String questionId;
  final bool isMcq;
  final String name;
  final String answer;
  final String topicId;

  Question({
    required this.questionId,
    required this.isMcq,
    required this.name,
    required this.answer,
    required this.topicId,
  });
}