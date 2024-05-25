import 'package:exam_front_end/Controllers/CommentController.dart';
import 'package:exam_front_end/Controllers/ExamController.dart';
import 'package:exam_front_end/Controllers/OptionController.dart';
import 'package:exam_front_end/Controllers/ProposedAnswerController.dart';
import 'package:exam_front_end/Controllers/QuestionController.dart';
import 'package:exam_front_end/Controllers/RatingController.dart';
import 'package:exam_front_end/Controllers/SubjectController.dart';
import 'package:exam_front_end/Controllers/TopicController.dart';
import 'package:exam_front_end/Controllers/UsersParticipatedController.dart';
import 'package:get/get.dart';

// import 'package:getxapp/controllers/tab_controller.dart';

class InitDepBinding implements Bindings {
  @override
  void dependencies() {
       Get.lazyPut(()=>UsersParticipatedController());
       Get.lazyPut(()=>CommentController());
       Get.lazyPut(()=>RatingController());
       Get.lazyPut(()=>ProposedAnswerController());
       Get.lazyPut(()=>OptionController());
       Get.lazyPut(()=>QuestionController());
       Get.lazyPut(()=>TopicController());
       Get.lazyPut(()=>SubjectController());
       Get.lazyPut(()=>ExamController());
   // other controllers ... 
  }
}