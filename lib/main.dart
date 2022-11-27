import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members.dart';
import 'AddMember.dart';
import 'list_4.dart';
import 'ListPage.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Members(),
      builder: (context, child) => MaterialApp(
        title: 'Team Member',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: AddMember(title: 'Add Team Member'),
      ),
    );
  }
}