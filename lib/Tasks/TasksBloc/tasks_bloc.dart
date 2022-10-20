import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mvvm_bloc_retrofit/Network/ApiClient.dart';
import 'package:mvvm_bloc_retrofit/Tasks/tasks_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final logger = Logger();
  TasksBloc() : super(TasksInitial()) {
    on<TasksEvent>((event, emit) async {
      if (event is FetchingTasks) {
        emit(TasksLoadingState());
        final client = RestClient(Dio());
        List<Task> tasks = await client.getTasks();
        logger.i("result = ${tasks}");
        emit(TasksLoadedState(tasks: tasks));
      }
    });
  }
}

class SingletonTwo {

  SingletonTwo._privateConstructor();

  static final SingletonTwo _instance = SingletonTwo._privateConstructor();

  static SingletonTwo get instance => _instance;

  void fetchDataFromApi() {

  }
}
