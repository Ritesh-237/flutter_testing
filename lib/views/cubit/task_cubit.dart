import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/task.dart';
import '../../repository/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit({required this.taskRepository}) : super(TaskInitialState());

  final TaskRepository taskRepository;
  Future<void> getAllTask() async {
    try {
      emit(TaskLoadingState());
      final response = await taskRepository.getTasks();
      emit(TaskLoadedState(tasks: response));
    } catch (e) {
      emit(TaskFailureState());
    }
  }
}
