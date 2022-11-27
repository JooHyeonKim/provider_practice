import 'package:flutter/material.dart';
import 'package:provider_practice/editpage.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/scores.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScorePanel(),
          SizedBox(height:20),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> EditPage()));
          }, child: Text('Edit')),
        ],
      ),
    );
  }
}

class ScorePanel extends StatelessWidget {
  const ScorePanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mid-Term',style: const TextStyle(fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            //읽어오는부분. 전역번수처럼 사용가능
            Text(context.watch<Scores>().midTermExam.toString(), style: const TextStyle(fontSize: 20)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Final',style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 20,
            ),
            //기말점수 읽어오는 부분
            Text(context.watch<Scores>().finalExam.toString(),style: const TextStyle(fontSize: 20)),
          ],
        ),
      ],
    );
  }
}
