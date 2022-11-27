import 'package:flutter/material.dart';

class Members with ChangeNotifier{
  int student_num = 0;
  List<String> listMember = [];

  void increaseMember(){
    if(student_num == 3){
      return;
    }
    student_num += 1;
    notifyListeners();
  }

  void decreaseMember(){
    student_num -= 1;
    notifyListeners();
  }

  void addList(String str){
    if(student_num < 3){
      listMember.add(str);
    }
    notifyListeners();
  }

}
