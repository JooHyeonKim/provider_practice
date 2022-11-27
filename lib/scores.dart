import 'package:flutter/material.dart';

//상속은 한번만 가능 with는 여러개 가능. dart에서는 다중상속 지원 x
//with : 상속은 아니지만 changeNotifier의 기능들 사용 가능
class Scores with ChangeNotifier {
  int midTermExam = 30;
  int finalExam = 30;

  decreaseMidTerm(){
    midTermExam -= 1;
    notifyListeners(); //watch를 하고 있는 모든 위젯들에게 업데이트 된 값을 뿌려줌
  }

  increaseMidTerm(){
    midTermExam += 1;
    notifyListeners();
  }

  decreaseFinal(){
    finalExam -= 1;
    notifyListeners(); //watch를 하고 있는 모든 위젯들에게 업데이트 된 값을 뿌려줌
  }

  increaseFinal(){
    finalExam += 1;
    notifyListeners();
  }
}

//Edit Scores 안에서만 사용하는 객체
class DetailedScores with ChangeNotifier{
  int additionalMidterm = 10;
  int additionalFinal = 10;
}