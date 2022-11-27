import 'package:flutter/material.dart';
import 'package:provider_practice/scores.dart';
import 'scorepage.dart';
import 'editpage.dart';
import 'package:provider/provider.dart';

//Scores 과 Edit Scores는 다른 서브트리에 있음에도 불구하고 같은 변수를 읽어올 수 있게됨.
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Scores(),
      builder: (context, child) => MaterialApp(
        title: 'My App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ScorePage(),
      ),
    );
  }
}
