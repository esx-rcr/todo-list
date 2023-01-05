class TaskEntity {
  TaskEntity({required this.title, this.completed = false});

  String title;
  bool completed;

  factory TaskEntity.fromMap(Map<String, dynamic> map) =>
      TaskEntity(title: map['title'], completed: map['completed']);
}
