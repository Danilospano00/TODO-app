class TodoModel {
  final String title;
  final String description;
  bool isRelevant;

  TodoModel({
    required this.title,
    required this.description,
    this.isRelevant = false,
  });
}
