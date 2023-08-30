import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_storage/components/todo_grid_tile.dart';
import 'package:lottie/lottie.dart';

import '../../components/todo_options.dart';
import '../../core/service_locator.dart';
import '../../domain/models/todo_model.dart';
import '../../domain/repository/todo_repository.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  final TodoRepository repository;

  const HomePage({super.key, required this.repository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _fetchTodos();
  }

  Future<void> _fetchTodos() async {
    todos = widget.repository.readTodo();
    setState(() {});
  }

  void navigateToDetailPage() async {
    /// Navigate to the DetailPage to add a new todo
    bool todoAdded = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(repository: widget.repository),
      ),
    );

    /// Refresh the list if a new todo was added
    if (todoAdded == true) {
      _fetchTodos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToDetailPage,
        child: const Icon(Icons.add),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 250,
              flexibleSpace: Center(
                child: FlexibleSpaceBar(
                  title: Lottie.asset('assets/lotties/todo_animation.json'),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 2,
                childAspectRatio: 1.45 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  Todo todo = todos[index];
                  return GestureDetector(
                    onLongPress: () {
                      showTodoOptions(todo, context, widget.repository,
                          (Todo todo) {
                        repository.deleteTodo(todo);
                        _fetchTodos();
                      });
                    },
                    child: TodoGridTile(todo: todo),
                  );
                },
                childCount: todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
