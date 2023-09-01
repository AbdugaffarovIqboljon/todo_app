import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learn_storage/domain/repository/todo_repository.dart';

import '../domain/models/todo_model.dart';

void showTodoOptions(Todo todo, BuildContext context, TodoRepository repository,
    void Function(Todo todo) deleteTodo) {
  showDialog(
    barrierColor: Colors.white.withOpacity(0.8),
    useSafeArea: true,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 13,
        shadowColor: Colors.deepPurpleAccent,
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              borderRadius: const BorderRadius.all(
                Radius.circular(13),
              ),
            ),
            child: const Text(
              'dialogCreated',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ).tr(),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  fixedSize: const Size(110, 50),
                ),
                onPressed: () {
                  deleteTodo(todo);
                  Navigator.pop(context);
                },
                child: const Text(
                  'yes',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ).tr(),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  fixedSize: const Size(110, 50),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'no',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ).tr(),
              ),
            ],
          ),
        ],
      );
    },
  );
}
