import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.7),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        maxLines: null,
        style: const TextStyle(fontSize: 22, color: Colors.white),
        clipBehavior: Clip.antiAlias,
        controller: titleController,
        textInputAction: TextInputAction.done,
        decoration: const InputDecoration(
          hintText: "Start typing here...",
          hintStyle: TextStyle(fontSize: 22, color: Colors.white),
          contentPadding: EdgeInsets.only(
            left: 20,
            bottom: 10,
            top: 10,
          ),
          border: InputBorder.none, // Remove the border line
        ),
      ),
    );
  }
}