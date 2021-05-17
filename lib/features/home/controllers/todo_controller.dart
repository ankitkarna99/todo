import 'package:todoapp/core/controllers/base_controller.dart';

class TodoModel {
  String text;
  bool isDone;

  TodoModel({this.text, this.isDone});
}

class TodoController extends BaseController {
  List<TodoModel> todos = [];

  void addTodo(String text) {
    todos.add(TodoModel(text: text, isDone: false));
    update();
  }

  void toggleDone(int index, bool value) {
    todos[index].isDone = value;
    update();
  }

  void deleteTodo(int index) {
    todos.removeAt(index);
    update();
  }
}
