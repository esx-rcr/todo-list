import 'package:flutter/material.dart';
import 'package:hello_world/components/task_component.dart';
import 'package:hello_world/entities/task_entity.dart';
import 'package:hello_world/pages/todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoController controller = TodoController();
  bool isLoading = true;
  List<TaskEntity> tasks = [];

  @override
  void initState() {
    super.initState();

    getTasks();
  }

  getTasks() async {
    tasks = await controller.getTasks();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TaskComponent(task: tasks[index]);
                },
              ),
            ),
    );
  }
}
