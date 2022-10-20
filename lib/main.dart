import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_bloc_retrofit/Tasks/TasksBloc/tasks_bloc.dart';
import 'package:mvvm_bloc_retrofit/Tasks/tasks_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (BuildContext context) => TasksBloc()..add(FetchingTasks()),
        child: const PostsPage(title: 'Tasks'),
      )
    );
  }
}

