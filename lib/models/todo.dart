class Todo {
  String? id;
  final String title;
  final String todo;
  final String imagePath;

  Todo({required this.title, required this.todo, required this.imagePath});

  toJSON() {
    return {
      'title': this.title,
      'todo': this.todo,
      'imagePath': this.imagePath
    };
  }

  factory Todo.fromJSON(Map<String, dynamic> json) {
    return Todo(
        title: json['title'], todo: json['todo'], imagePath: json['imagePath']);
  }
}
