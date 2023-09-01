class Todo {
  int id;
  String title;
  String description;
  DateTime? deadline;
  bool isCompleted;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    this.deadline,
  });

  factory Todo.fromJson(Map<String, Object?> json) => Todo(
        id: json['id'] as int,
        title: json['title'] as String,
        description: json['description'] as String,
        isCompleted: json['isCompleted'] == 1 ? true : false,
        deadline: json['deadline'] != null
            ? DateTime.parse(json['deadline'] as String)
            : null,
      );

  Map<String, Object?> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isCompleted': isCompleted ? 1 : 0,
        'deadline': deadline != null ? deadline!.toIso8601String() : null,
      };

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, description: $description, deadline: $deadline, isCompleted: $isCompleted}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          other.isCompleted == isCompleted;

  @override
  int get hashCode => Object.hash(id, title, isCompleted);
}
