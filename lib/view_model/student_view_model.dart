import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/student_model.dart';
import 'package:riverpod_test/state/student_state.dart';

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
        (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initial());

  void addStudent(Student student) async {
    state = state.copyWith(isLoading: true);

    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false, student: student);
  }

  void deleteStudent(int index) async {
    state = state.copyWith(isLoading: true);

    // Wait for 2 seconds
    await Future.delayed(const Duration(seconds: 2));
    state = state.delete(isLoading: false, index: index);
  }
}
