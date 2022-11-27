import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/scores.dart';

//select, watch, read
class EditPage extends StatelessWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailedScores(),
      //child: Scaffold -> 빨간창
      //ChangeNotifierProvider가 watch 하는 객체가 너무 가까이 있으면 문제가 생기기 때문에 builder를 써야함.
      //하나의 context를 공유하는 상황.
      builder: (context, child) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Scores'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditPanel(),
            Text('Additional Midterm', style:TextStyle(fontSize:16)),
            Text(context.watch <DetailedScores>().additionalMidterm.toString()),
            Text('Additional Final',style:TextStyle(fontSize:16)),
            Text(context.watch <DetailedScores>().additionalFinal.toString()),
          ],
        ),
      ),
    );
  }
}

class EditPanel extends StatelessWidget {
  const EditPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text('Mid-Term', style:TextStyle(fontSize:16),),width:100),

            TextButton(onPressed: (){
              //read : 구독을 하지 않고 단순히 함수를 가져와서 쓰고싶을때.
              //function사용할 때는 성능상으로 굳이 watch할 필요 없음.
              context.read<Scores>().decreaseMidTerm();
            }, child: Text('-',style:TextStyle(fontSize:16))),

            //watch : 업데이트 된 데이터를 실시간으로 확인해야될 때. 즉, 구독을 하고 싶을 때
            //select . 중간고사 점수만 관심. 성능을 위해 사용필요
            Text(context.select((Scores s) => s.midTermExam).toString(),style:TextStyle(fontSize:16)),

            TextButton(onPressed: (){
              context.read<Scores>().increaseMidTerm();
            }, child: Text('+',style:TextStyle(fontSize:16))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text('Final', style:TextStyle(fontSize:16),), width:100),
            TextButton(onPressed: (){
              context.read<Scores>().decreaseFinal();
            }, child: Text('-',style:TextStyle(fontSize:16),)),

            //select
            Text(context.select((Scores s) => s.finalExam).toString(),style:TextStyle(fontSize:16)),
            TextButton(onPressed: (){
              context.read<Scores>().increaseFinal();
            }, child: Text('+',style:TextStyle(fontSize:16),)),
          ],
        ),
      ],
    );
  }
}

