import 'package:bloc_test/bloc_test.dart';
import 'package:dummy/models/task.dart';
import 'package:dummy/repository/task_repository.dart';
import 'package:dummy/views/%20counter_bloc/counter_bloc.dart';
import 'package:dummy/views/cubit/task_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {
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

void main() {
  late CounterBloc counterBloc;
  late TaskCubit taskCubit;
  late MockTaskRepository taskRepository;
  setUp(() {
    counterBloc = CounterBloc();
    taskRepository = MockTaskRepository();
    taskCubit = TaskCubit(taskRepository: taskRepository);
  });

  blocTest('counter Bloc Success State',
      build: () => counterBloc,
      act: (bloc) => bloc.add(const IncrementCounterEvent(value: 1)),
      expect: () =>
          [IncrementLoadingState(), const IncrementLoadedState(result: 100.0)]);

  blocTest(
    'emits [2] when CounterIncrementPressed is added twice',
    build: () => CounterBloc(),
    act: (bloc) => bloc
      ..add(const IncrementCounterEvent(value: 1))
      ..add(const IncrementCounterEvent(value: 2)),
    // seed: () => const IncrementLoadedState(result: 50.0),
    // will skip these states IncrementLoadingState(), const IncrementLoadedState(result: 100.0)
    skip: 2,
    expect: () =>
        [IncrementLoadingState(), const IncrementLoadedState(result: 50.0)],
    verify: (bloc) {
      //  verify(() => emit(IncrementLoadingState()).called(1));
    },
  );

  blocTest(
    'Counter Bloc Type State',
    build: () => counterBloc,
    act: (bloc) => bloc.add(const IncrementCounterEvent(value: 0)),
    expect: () => [isA<CounterState>(), isA<CounterState>()],
  );

  blocTest(
    'Counter Bloc Failure State',
    build: () => counterBloc,
    act: (bloc) => bloc.add(const IncrementCounterEvent(value: null)),
    expect: () => [
      IncrementLoadingState(),
      const IncrementFailureState(error: 'TypeCasting Failed')
    ],
  );

  blocTest(
    'emits [TaskLoadingState, TaskLoadedState] for sucessfull task loads',
    build: () => taskCubit,
    act: (taskCubit) => taskCubit.getAllTask(),
    expect: () => [
      TaskLoadingState(),
      TaskLoadedState(tasks: const [
        Task(id: 0, name: 'This'),
        Task(id: 1, name: 'is'),
        Task(id: 2, name: 'task'),
        Task(id: 3, name: 'Perform')
      ])
    ],
  );

  tearDown(() {
    taskCubit.close();
    counterBloc.close();
  });
}
