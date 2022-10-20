part of 'tasks_bloc.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoadingState extends TasksState {}

class TasksLoadedState extends TasksState {
  List<Task> tasks;
  TasksLoadedState({required this.tasks});
}

class TasksFailedState extends TasksState {
  String error;
  TasksFailedState({required this.error});
}



