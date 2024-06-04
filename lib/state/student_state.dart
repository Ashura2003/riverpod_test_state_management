import 'package:riverpod_test/model/student_model.dart';

class StudentState {
  final List<Student> lstStudent;
  final bool isLoading;

  // Main Constructor
  StudentState({
    required this.lstStudent,
    required this.isLoading,
  });

  // Initial Constructor
  factory StudentState.initial() {
    return StudentState(
      lstStudent: [],
      isLoading: false,
    );
  }

  // CopyWith function
  StudentState copyWith({
    Student? student,
    bool? isLoading,
  }) {
    return StudentState(
      lstStudent: student != null ? [...lstStudent, student] : lstStudent,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // Delete function
  StudentState delete({
    Student? student,
    bool? isLoading,
    required int index,
  }) {
    return StudentState(
      lstStudent: student != null ? [lstStudent[index]] : lstStudent..removeAt(index),
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
