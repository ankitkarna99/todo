import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:todoapp/features/home/controllers/todo_controller.dart';

class HomeView extends StatelessWidget {
  final TextEditingController todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TodoController>(
        init: TodoController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (context, index) {
                        final todo = controller.todos[index];

                        return ListTile(
                          leading: Checkbox(
                              value: todo.isDone,
                              onChanged: (value) {
                                controller.toggleDone(index, value);
                              }),
                          title: Text(todo.text),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              controller.deleteTodo(index);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                                      child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: todoTextController,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            controller.addTodo(todoTextController.text);
                            todoTextController.clear();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
