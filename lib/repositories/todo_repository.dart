import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

class TodoRepository {

  TodoRepository() {
    SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      print(sharedPreferences.getString('todo_list')); v
    });
  }

  late SharedPreferences sharedPreferences;

  Future<void> getTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveTodoList(List<Todo> todos) {
    final jsonString = json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
  }

}