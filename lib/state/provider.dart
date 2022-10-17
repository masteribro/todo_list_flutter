import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier{

  bool addButton = false;

  TextEditingController todoController = TextEditingController();
  List maplist = [];
  bool hassan = false;



  meth(){
    maplist.add(todoController.text.toString());
    todoController.clear();
    notifyListeners();
  }
  delete(String todoText){
    hassan=!hassan;
    maplist.remove(todoText);
    notifyListeners();
  }
}