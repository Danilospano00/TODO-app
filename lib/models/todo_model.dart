class TodoModel {
  String title;
  String description;
  bool isRelevant;

  TodoModel({
    required this.title,
    required this.description,
    this.isRelevant = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final title = json['title'] ?? '';
    final description = json['description'] ?? '';
    final isRelevant = json['relevant'] ?? '';

    return TodoModel(
      title: title,
      description: description,
      isRelevant: isRelevant,
    );
  }
}
