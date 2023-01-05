import 'package:flutter/material.dart';
import 'package:hello_world/entities/task_entity.dart';

class TaskComponent extends StatefulWidget {
  TaskEntity task;
  TaskComponent({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskComponent> createState() => _TaskComponentState();
}

class _TaskComponentState extends State<TaskComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.task.title.toString()),
        const Spacer(),
        Checkbox(
          value: widget.task.completed,
          onChanged: (value) {
            setState(() {
              widget.task.completed = value!;
            });
          },
        ),
      ],
    );
  }
}
