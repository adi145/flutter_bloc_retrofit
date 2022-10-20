
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_bloc_retrofit/Tasks/TasksBloc/tasks_bloc.dart';
import 'package:mvvm_bloc_retrofit/Tasks/TasksBloc/tasks_bloc.dart';
import 'package:mvvm_bloc_retrofit/Tasks/tasks_model.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
        if (state is TasksLoadedState) {
          return RefreshIndicator(
            onRefresh: () async =>
                context.read<TasksBloc>().add(FetchingTasks()),
            child: ListView.separated(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                Task post = state.tasks[index];
                return ListTile(
                    title: Text(
                      '${post.id}',
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      '${post.name}',
                      maxLines: 1,
                    ));
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 1, color: Colors.grey);
              },
            ),
          );
        } else if (state is TasksFailedState) {
          return Center(
            child: Text(state.error),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
