part of 'task_cubit.dart';

class TaskState {
  final DateTime? selectedDate;

  TaskState({this.selectedDate});

  TaskState copyWith({DateTime? selectedDate}) {
    return TaskState(selectedDate: selectedDate ?? this.selectedDate);
  }
}
