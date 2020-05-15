import 'dart:io';
import 'package:dio/dio.dart';

import '../user.dart';
import 'package:todos/models/todo-item.model.dart';

class TodoRepository {
  Future<List<TodoItem>> getTodayTodos() async {
    // var url = "$baseURL/v1/todos/undone/today";

    // Response response = await Dio().get(
    //   url,
    //   options: Options(
    //     headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
    //   ),
    // );
    // return (response.data as List)
    //     .map((todo) => TodoItem.fromJson(todo))
    //     .toList();

    var todos = new List<TodoItem>();
    todos.add(
      new TodoItem(
        id: "1",
        title: "Hoje",
        done: false,
        date: DateTime.now(),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return todos;
  }

  Future<List<TodoItem>> getTomorrowTodos() async {
    var todos = new List<TodoItem>();
    todos.add(
      new TodoItem(
        id: "2",
        title: "Amanhã",
        done: false,
        date: DateTime.now().add(new Duration(days: 1)),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return todos;
  }

  Future<List<TodoItem>> getAllTodos() async {
    var todos = new List<TodoItem>();
    todos.add(new TodoItem(
      id: "1",
      title: "Hoje",
      done: true,
      date: DateTime.now(),
    ));

    todos.add(new TodoItem(
      id: "2",
      title: "Amanhã",
      done: false,
      date: DateTime.now().add(new Duration(days: 1)),
    ));

    await Future.delayed(const Duration(milliseconds: 1000), () {});
    return todos;
  }

  Future<TodoItem> add(TodoItem item) async {
    var url = "baseURL/v1/todos";

    try {
      Response response = await Dio().post(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );

      return TodoItem.fromJson(response.data["data"]);
    } catch (error) {
      return null;
    }
  }

  Future<TodoItem> markAsDone(TodoItem item) async {
    var url = "baseURL/v1/todos";

    try {
      Response response = await Dio().put(
        url,
        data: item,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: 'Bearer ${user.token}'},
        ),
      );

      return TodoItem.fromJson(response.data["data"]);
    } catch (error) {
      return null;
    }
  }
}
