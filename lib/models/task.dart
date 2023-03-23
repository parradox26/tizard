class Task {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime dueDate;
  String? location;
  List<String>? tags;

  Task({
    required this.id,
    required this.title,
    this.description = "",
    this.isCompleted = false,
    required this.dueDate,
    this.location,
    this.tags,
  });

  set completed(bool completed) {
    isCompleted = completed;
  }
}
