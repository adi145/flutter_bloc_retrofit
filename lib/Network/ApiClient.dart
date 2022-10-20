import 'package:mvvm_bloc_retrofit/Tasks/tasks_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ApiClient.g.dart';

class ApiConstants {
  static const baseUrl = "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/";
  static const tasks = "/tasks";
}

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(ApiConstants.tasks)
  Future<List<Task>> getTasks();
}

