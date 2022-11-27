import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'members.dart';
import 'ListPage.dart';


class AddMember extends StatelessWidget {
  const AddMember({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ListPage()));
        }, icon: const Icon(Icons.list))],
      ),
      body: const AddForm(),
    );
  }
}

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Members>(context!, listen: false);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'The number of our team members is: ',
          ),
          const SizedBox(height:20),
          Text(
            context.watch <Members>().student_num.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height:20),
          ElevatedButton(
            onPressed: () {
              if(context.read <Members>().student_num == 3){
                showModalBottomSheet(
                  // groundColor: Colors.grey,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                          value: viewModel,
                          child: Full());
                    }
                );
              }
              else{
                showModalBottomSheet(
                  // groundColor: Colors.grey,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ChangeNotifierProvider.value(
                          value: viewModel,
                          child: ConfirmModal());
                    }
                );
              }

            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class Full extends StatefulWidget {
  const Full({Key? key}) : super(key: key);

  @override
  State<Full> createState() => _FullState();
}

class _FullState extends State<Full> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text('The team is alreay full.'),
          ],
        ),
      ),
    );
  }
}


class ConfirmModal extends StatefulWidget {
  const ConfirmModal({Key? key}) : super(key: key);

  @override
  State<ConfirmModal> createState() => _ConfirmModalState();
}

class _ConfirmModalState extends State<ConfirmModal> {
  final nameController = TextEditingController();
  final noController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2,  right: 2,  left: 2,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox( height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Student No: '),
              Container(
                width: 120.0,
                child: TextFormField(
                  controller: noController,
                ),
              ),
              const SizedBox(
                  width:20
              ),
              const Text('Name : '),
              Container(
                width: 120.0,
                child: TextFormField(
                  controller: nameController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: (){
                context.read<Members>().addList('${nameController.text} (${(noController.text)})');
                context.read<Members>().increaseMember();
                noController.clear();
                nameController.clear();
                Navigator.pop(context);
              },
              child: const Text('Enter')),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}