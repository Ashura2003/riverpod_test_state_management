import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/model/student_model.dart';
import 'package:riverpod_test/view_model/student_view_model.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  var gap = const SizedBox(
    height: 10,
  );
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Listern for the state changes from the provider
    final studentState = ref.watch(studentViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Student View App',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: fnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
                hintText: 'Enter your first name',
              ),
            ),
            gap,
            TextFormField(
              controller: lnameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Last Name',
                hintText: 'Enter your last name',
              ),
            ),
            gap,
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Address',
                hintText: 'Enter your Address',
              ),
            ),
            gap,
            ElevatedButton(
              onPressed: () {
                Student student = Student(
                  fname: fnameController.text,
                  lname: lnameController.text,
                  address: addressController.text,
                );

                ref.read(studentViewModelProvider.notifier).addStudent(student);
              },
              child: const Text(
                'Add Student',
              ),
            ),
            gap,
            studentState.isLoading
                ? const CircularProgressIndicator()
                : studentState.lstStudent.isEmpty
                    ? const Text(
                        "There is no data currently",
                      )
                    : Expanded(
                        child: ListView.builder(
                            itemCount: studentState.lstStudent.length,
                            itemBuilder: (context, index) {
                              Student student = studentState.lstStudent[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    '${student.fname} ${student.lname}',
                                  ),
                                  subtitle: Text(
                                    student.address,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit),
                                        onPressed: () {},
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          ref
                                              .read(studentViewModelProvider
                                                  .notifier)
                                              .deleteStudent(index);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
          ],
        ),
      ),
    );
  }
}
