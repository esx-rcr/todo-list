import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hello_world/entities/errors.dart';

import '../entities/task_entity.dart';

class TodoRepository {
  TodoRepository();

  Future<Either<Failure, List<TaskEntity>>> getTaskList() async {
    Dio dio = Dio();
    List<TaskEntity> tasks = [];

    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/todos');

      response.data.forEach((value) {
        tasks.add(TaskEntity.fromMap(value));
      });

      return Right(tasks);
    } catch (ex) {
      return Left(Error(ex.toString()));
    }
  }
}
