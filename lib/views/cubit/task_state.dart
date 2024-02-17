part of 'task_cubit.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskInitialState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadingState extends TaskState {
  @override
  List<Object> get props => [];
}

class TaskLoadedState extends TaskState {
  final List<Task> tasks;

  TaskLoadedState({required this.tasks});
  @override
  List<Object> get props => [tasks];
}

class TaskFailureState extends TaskState {
  @override
  List<Object> get props => [];
}
