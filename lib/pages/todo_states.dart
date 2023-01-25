import 'package:hello_world/entities/task_entity.dart';

abstract class TodoState {}

class InitialState extends TodoState {}

class SuccessState extends TodoState {
  final List<TaskEntity> result;

  SuccessState({required this.result});
}

class LoadingState extends TodoState {}

class ErrorState extends TodoState {
  final String message;

  ErrorState(this.message);
}
