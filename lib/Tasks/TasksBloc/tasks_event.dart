
// part of 'Tasks/TasksBloc/tasks_bloc.dart';
part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {}

class FetchingTasks extends TasksEvent{}
