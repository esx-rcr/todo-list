import 'package:flutter/cupertino.dart';
import 'package:hello_world/pages/todo_states.dart';

import '../repositories/todo_repository.dart';

class TodoController extends ValueNotifier<TodoState> {
  TodoController() : super(InitialState());

  TodoRepository rep = TodoRepository();

  void emit(TodoState newState) => value = newState;

  Future<void> getTasks() async {
    emit(LoadingState());

    var result = await rep.getTaskList();
    var newState =
        result.fold((l) => ErrorState("asd"), (r) => SuccessState(result: r));

    emit(newState);
  }
}
