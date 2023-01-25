import 'package:flutter/material.dart';
import 'package:hello_world/components/task_component.dart';
import 'package:hello_world/pages/todo_controller.dart';
import 'package:hello_world/pages/todo_states.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoController controller = TodoController();

  @override
  void initState() {
    super.initState();
    controller.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"),
      ),
      body: ValueListenableBuilder(
        valueListenable: controller,
        builder: (context, value, child) {
          if (value is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (value is ErrorState) {
            return const Text("Deu Ruim");
          }

          if (value is SuccessState) {
            var convertido = value;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: convertido.result.length,
                itemBuilder: (context, index) {
                  return TaskComponent(task: convertido.result[index]);
                },
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
