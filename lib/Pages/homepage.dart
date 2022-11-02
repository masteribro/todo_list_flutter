import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/LocalStorage/session_manager.dart';
import 'package:todo_list/Pages/paystack.dart';
import 'package:todo_list/state/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Widget buildTodoItem(String todoText) {
    return Consumer<TodoProvider>(
      builder: (_, value, __){
      return ListTile(
        title: Text(todoText),
        trailing: InkWell(
            onTap: (){
             value.delete(todoText);
            },
            child:  const Icon(Icons.delete, )),
      );}
    );
  }
  TodoProvider? todoProvider;
@override
  void initState() {
    super.initState();
    todoProvider = Provider.of<TodoProvider>(context,listen:false);
    todoProvider?.maplist = SessionManager.getTodos() ?? [];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo-list'),
      centerTitle: true,
      backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.fromLTRB(10,2,10,2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.black12)
                ),
                child: TextField(
                  controller: context.read<TodoProvider>().todoController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Type in your list",

                  ),

                ),
              ),

              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: ()=>context.read<TodoProvider>().meth(),
                  child: const Text('Add', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                )
              ),
              ElevatedButton(onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PayStack()),
              );}, child: const Text('Pay for this App'),
                style: ElevatedButton.styleFrom(
                primary: Colors.black,
              )
              ),
              Consumer<TodoProvider>(
                builder: (_,value,__){
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.maplist.length,
                    itemBuilder: (BuildContext context, int index) {

                      return  Dismissible(
                        key: Key(value.maplist[index]),
                        onDismissed: (direction) => value.maplist.removeAt(index),
                        background: Container(color: Colors.black12),
                        child: index < value.maplist.length? buildTodoItem( value.maplist[index]): Text('Add Items'),
                      );




                    },

                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}
