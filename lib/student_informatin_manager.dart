import 'dart:io';

// ================= ABSTRACT CLASS =================

abstract class Person {
  void displayInfo();
}

// ================= STUDENT CLASS =================

class Student extends Person {
  // Private fields (Encapsulation)
  final String _name;
  final int _age;
  final String _department;

  // Constructor
  Student(this._name, this._age, this._department);

  // Getters
  String get name => _name;
  int get age => _age;
  String get department => _department;

  // Override method
  @override
  void displayInfo() {
    print("Name: $_name");
    print("Age: $_age");
    print("Department: $_department");
  }
}

// ================= FUNCTIONS =================

// Add Student
void addStudent(List<Student> students) {
  print("\nEnter Student Name:");
  String name = stdin.readLineSync()!;

  print("Enter Age:");
  int age = int.parse(stdin.readLineSync()!);

  print("Enter Department:");
  String department = stdin.readLineSync()!;

  students.add(Student(name, age, department));

  print("\nStudent added successfully!\n");
}

// View Students
void viewStudents(List<Student> students) {
  if (students.isEmpty) {
    print("\nNo students found.\n");
    return;
  }

  print("\n===== Student List =====");

  for (var student in students) {
    student.displayInfo();
    print("-----------------------");
  }
}

// Search Student
void searchStudent(List<Student> students) {
  print("\nEnter student name to search:");
  String search = stdin.readLineSync()!;

  bool found = false;

  for (var student in students) {
    if (student.name.toLowerCase() == search.toLowerCase()) {
      print("\nStudent Found:");
      student.displayInfo();
      found = true;
      break;
    }
  }

  if (!found) {
    print("Student not found.");
  }
}

// Delete Student
void deleteStudent(List<Student> students) {
  print("\nEnter student name to delete:");
  String search = stdin.readLineSync()!;

  students.removeWhere(
    (student) => student.name.toLowerCase() == search.toLowerCase(),
  );

  print("Student deleted (if found).");
}

// Arrow Function
int totalStudents(List<Student> students) => students.length;

// ================= MAIN =================

void main() {
  List<Student> students = [];

  while (true) {
    print('''
===== Student Information Manager =====

1. Add Student
2. View Students
3. Search Student
4. Delete Student
5. Exit

Total Students: ${totalStudents(students)}

Choose an option:
''');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        addStudent(students);
        break;

      case "2":
        viewStudents(students);
        break;

      case "3":
        searchStudent(students);
        break;

      case "4":
        deleteStudent(students);
        break;

      case "5":
        print("Thank you!");
        return;

      default:
        print("Invalid choice.\n");
    }
  }
}
