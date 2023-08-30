import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../domain/models/todo_model.dart';


Widget getDeadlineText(Todo todo) {
  if (todo.deadline == null) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 40),
      child: Center(child: Text('No Deadline')),
    );
  } else {
    final deadlineDate = todo.deadline!;
    final now = DateTime.now();
    final daysLeft = deadlineDate.difference(now).inDays;

    final formattedDeadline = DateFormat('yyyy-MM-dd')
        .format(deadlineDate); // Use the same format used in DetailPage
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 13.5),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Deadline:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Date: $formattedDeadline,\nDays: $daysLeft days left',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
