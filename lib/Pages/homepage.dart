import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool addButton = false;
  TextEditingController todoController = TextEditingController();
  List maplist = [];
  Widget _buildTodoItem(String todoText) {
    return ListTile(
        title: Text(todoText)
    );
  }
  var hassan;
   int? index;
  meth(){
    setState(() {
       index = maplist.length;
      maplist.add('Item ' + todoController.text.toString());
    });
    print(index);
    todoController.clear();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo-list'),),
      body: Column(
        children: [
         TextField(

           controller: todoController,
         ),
          ElevatedButton(
              onPressed: ()=>meth(),
              child: const Text('Add', style: TextStyle(color: Colors.black),)
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: maplist.length,
            itemBuilder: (BuildContext context, int index) {
              
                return index < maplist.length?_buildTodoItem(maplist[index]): Text('Add Items');
              

            },

          )
        ],
      ),
    );
  }
}
