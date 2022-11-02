
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences? _preferences;
  static const _listOfTodos = 'pets';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setTodos(List<String> todoList) async =>
      await _preferences?.setStringList(_listOfTodos, todoList);
  static List<String>? getTodos() => _preferences?.getStringList(_listOfTodos);
}
