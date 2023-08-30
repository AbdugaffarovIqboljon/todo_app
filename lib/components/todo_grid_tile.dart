import 'package:flutter/material.dart';

import '../domain/models/todo_model.dart';
import 'get_deadline_widget.dart';

class TodoGridTile extends StatefulWidget {
  final Todo todo;

  const TodoGridTile({super.key, required this.todo});

  @override
  State<TodoGridTile> createState() => _TodoGridTileState();
}

class _TodoGridTileState extends State<TodoGridTile> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Align(
        alignment: const Alignment(0.85, -2.7),
        child: Checkbox(
          value: isCompleted,
          onChanged: (value) {
            setState(() => isCompleted = !isCompleted);
          },
        ),
      ),
      footer: isCompleted == false
          ? getDeadlineText(widget.todo)
          : Center(
              heightFactor: 5,
              child: Text(
                'Task Completed',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurpleAccent),
            color: isCompleted == false
                ? Colors.deepPurple.shade50
                : Colors.deepPurpleAccent.shade100.withOpacity(0.5),
            borderRadius: const BorderRadius.all(
              Radius.circular(17),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8,
            ),
            child: isCompleted == false
                ? Text("\nTITLE: \n\n${widget.todo.title}")
                : RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "\nTITLE",
                            style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(
                          text: "\n\n${widget.todo.title}",
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
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
    );
  }
}
