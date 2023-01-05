import 'package:dio/dio.dart';

class TodoRepository {
  TodoRepository();

  Future getTaskList() async {
    Dio dio = Dio();

    final response =
        await dio.get('https://jsonplaceholder.typicode.com/todos');

    return response;
  }
}
