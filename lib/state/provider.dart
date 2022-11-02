import 'package:flutter/material.dart';

import '../LocalStorage/session_manager.dart';

class TodoProvider with ChangeNotifier{

  bool addButton = false;

  TextEditingController todoController = TextEditingController();
  List<String> maplist = [];
  bool hassan = false;

  meth()async{
     maplist.add(todoController.text.toString());
   await SessionManager.setTodos(maplist);
    todoController.clear();
    notifyListeners();
  }
  delete(String todoText)async{
    hassan=!hassan;
    maplist.remove(todoText);
    await SessionManager.setTodos(maplist);
    notifyListeners();
  }
}