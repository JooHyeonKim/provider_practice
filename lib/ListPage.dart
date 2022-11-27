import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Member List'),
      ),
      body: MyListPage(),
    );
  }
}

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: context.read<Members>().listMember.length,
      itemBuilder: (c, i){
        return Dismissible(
          key: ValueKey(context.read<Members>().listMember[i]),
          background: Container(
            color: Colors.green,
          ),
          child: ListTile(
            title: Text(context.read<Members>().listMember[i]),
          ),
          onDismissed: (direction) {
            setState(() {
              (context.read <Members>().listMember.removeAt(i));
              context.read<Members>().decreaseMember();
            });
          },
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          // listPoint.insert(newIndex, listPoint.removeAt(oldIndex));
        });
      },
    );
  }
}