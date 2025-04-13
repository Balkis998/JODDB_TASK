import 'package:flutter_bloc/flutter_bloc.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState());

  void updateSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: date));
  }
}
