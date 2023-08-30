import 'dart:convert';

import 'package:learn_storage/domain/repository/todo_repository.dart';

import '../../data/local_data_source.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final LocalDataSource dataSource;

  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<bool> clearCache() {
    return dataSource.remove(StorageKey.todos);
  }

  @override
  Future<bool> deleteTodo(Todo todo) async {
    // Get the existing list of todos
    List<Todo> list = readTodo();

    // Remove the todo from the list if it exists
    list.removeWhere((element) => element.id == todo.id);

    // Encode the updated list to JSON and store it
    final json = list.map((todo) => todo.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.todos, data);
  }

  @override
  List<Todo> readTodo() {
    String data = dataSource.read(StorageKey.todos) ?? "[]";
    final json = jsonDecode(data) as List;
    return json
        .map((item) => Todo.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<bool> storeTodo(Todo todo) {
    // Get the existing list of todos
    List<Todo> list = readTodo();

    // Add the new todo to the list
    list.add(todo);

    // Encode the list to JSON and store it
    final json = list.map((todo) => todo.toJson()).toList();
    final data = jsonEncode(json);
    return dataSource.store(StorageKey.todos, data);
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    // Get the list of todos from the data source
    final List<Todo> todos = readTodo();

    // Find the index of the todo in the list
    int index = todos.indexWhere((element) => element.id == todo.id);

    // If the todo is found, update it with the new input
    if (index != -1) {
      todos[index] = todo;
    }

    // Save the updated list of todos to the data source
    final json = todos.map((todo) => todo.toJson()).toList();
    final data = jsonEncode(json);
    await dataSource.store(StorageKey.todos, data);
  }
}
