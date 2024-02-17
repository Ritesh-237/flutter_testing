import '../models/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
}

class TaskRepositoryImpl implements TaskRepository {
  @override
  Future<List<Task>> getTasks() {
    return Future.value([
      const Task(id: 0, name: 'This'),
      const Task(id: 1, name: 'is'),
      const Task(id: 2, name: 'task'),
      const Task(id: 3, name: 'Perform')
    ]);
  }
}
