import 'package:learn_storage/domain/models/todo_model.dart';

abstract class TodoRepository {
  Future<bool> storeTodo(Todo todo);

  List<Todo> readTodo();

  Future<bool> deleteTodo(Todo todo);

  Future<bool> clearCache();

  Future<void> updateTodo(Todo todo);

  Future<void> completedTodo(Todo todo);
}
