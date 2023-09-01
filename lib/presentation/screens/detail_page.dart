import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:learn_storage/components/custom_text_field.dart';
import 'package:learn_storage/domain/repository/todo_repository.dart';

import '../../components/show_success_dialog.dart';
import '../../domain/models/todo_model.dart';

class DetailPage extends StatefulWidget {
  final TodoRepository repository;

  const DetailPage({Key? key, required this.repository}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DateTime? selectedDeadline;
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> pickDeadline() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDeadline ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );

      if (picked != null && picked != selectedDeadline) {
        setState(() {
          selectedDeadline = picked;
        });
      }
    }

    void createTodo() {
      String title = titleController.text.trim();
      if (title.isNotEmpty) {
        Todo newTodo = Todo(
          id: DateTime.now().millisecondsSinceEpoch,
          title: title,
          description: '',
          deadline: selectedDeadline,
          isCompleted: false,
        );

        // Storing new todos
        widget.repository.storeTodo(newTodo);

        Navigator.pop(context, true);
      }
      if (titleController.text.isEmpty) {
        return;
      } else {
        showSuccessDialog(context);
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: createTodo,
        child: const Icon(Icons.save_rounded),
      ),
      appBar: AppBar(
        title: const Text('addTodo').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              CustomTextField(titleController: titleController),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent.shade100,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: TextButton(
                  onPressed: pickDeadline,
                  child: Text(
                    selectedDeadline != null
                        ? '${'Deadline'.tr()}: ${DateFormat.yMMMMd().format(selectedDeadline!)}'
                        : 'setDeadline'.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
