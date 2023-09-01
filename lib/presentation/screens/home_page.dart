import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:learn_storage/components/animated_container.dart';
import 'package:learn_storage/components/custom_conatiner.dart';
import 'package:lottie/lottie.dart';

import '../../components/get_deadline_widget.dart';
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
  bool _isTapped = false;

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
              toolbarHeight: 200,
              flexibleSpace: Center(
                child: FlexibleSpaceBar(
                  title: Lottie.asset('assets/lotties/todo_animation.json',
                      repeat: false),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 38.0,
                  horizontal: 8.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    _isTapped = !_isTapped;
                    setState(() {});
                  },
                  child: _isTapped == true
                      ? const CustomAnimatedContainer().animate().slideX()
                      : const CustomContainer(),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 2,
                childAspectRatio: 1.35 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final todo = todos[index];
                  return GestureDetector(
                    onLongPress: () {
                      showTodoOptions(todo, context, widget.repository,
                          (Todo todo) {
                        repository.deleteTodo(todo);
                        _fetchTodos();
                      });
                    },
                    child: GridTile(
                      header: Align(
                        alignment: const Alignment(0.85, -2.7),
                        child: Checkbox(
                          value: todo.isCompleted,
                          onChanged: (bool? value) {
                            repository.completedTodo(todo);
                            _fetchTodos();
                          },
                        ),
                      ),
                      footer: todo.isCompleted == false
                          ? getDeadlineText(todo)
                          : Center(
                              heightFactor: 5,
                              child: Text(
                                'completed',
                                style: Theme.of(context).textTheme.labelLarge,
                              ).tr(),
                            ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepPurpleAccent),
                            color: todo.isCompleted == false
                                ? Colors.deepPurple.shade50
                                : Colors.deepPurpleAccent.shade100
                                    .withOpacity(0.5),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(17),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 8,
                            ),
                            child: todo.isCompleted == false
                                ? Text("\n${'title'.tr()}: \n\n${todo.title}")
                                : RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "\n${'title'.tr()}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        TextSpan(
                                          text: "\n\n${todo.title}",
                                          style: const TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
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
