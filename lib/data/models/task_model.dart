class TaskModel {
  final int? id;
  final String? title;
  final String? studentId;
  final String? createdAt;
  final String? updatedAt;
  final bool? isDone;
  TaskModel({
     this.id,
     this.title,
     this.studentId,
     this.createdAt,
     this.updatedAt,
     this.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> jsonMap) {
    return TaskModel(
      id: jsonMap["id"],
      title: jsonMap["title"],
      studentId: jsonMap["student_id"].toString(),
      createdAt: jsonMap["created_at"],
      updatedAt: jsonMap["updated_at"],
      isDone: jsonMap["is_done"],
    );
  }
}
