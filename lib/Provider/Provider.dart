import 'package:flutter/material.dart';

class ExamProvider extends ChangeNotifier {
   int _numberOfLikes = 0;
   
   int get_numberOfLikes() => _numberOfLikes;

   void set_numberOfLikes(){
    _numberOfLikes++;
    notifyListeners();// To listen for the change .. 
   } 
}