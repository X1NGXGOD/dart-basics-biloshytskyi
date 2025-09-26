import 'student.dart';
import 'course.dart';

abstract class Person {
  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;

  Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  String get fullName;
  int get age;
  String get role;
}

class Professor extends Person {
  final String department;
  final List<String> taughtCourses;
  final double salary;

  Professor({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    required this.department,
    required this.salary,
    List<String>? taughtCourses,
  })  : taughtCourses = taughtCourses ?? [];

  @override
  String get fullName => "$firstName $lastName";

  @override
  int get age => DateTime.now().year - birthDate.year;

  @override
  String get role => "Professor";

  void assignCourse(String courseId) {
    if (!taughtCourses.contains(courseId)) {
      taughtCourses.add(courseId);
    }
  }
}

class University {
  final String name;
  final List<Student> students;
  final List<Professor> professors;
  final List<Course> courses;

  University({
    required this.name,
    List<Student>? students,
    List<Professor>? professors,
    List<Course>? courses,
  })  : students = students ?? [],
        professors = professors ?? [],
        courses = courses ?? [];

  void addStudent(Student student) => students.add(student);
  void removeStudent(String studentId) =>
      students.removeWhere((s) => s.id == studentId);

  Student? findStudentById(String id) =>
      students.firstWhere((s) => s.id == id, orElse: () => null as Student);

  List<Student> getStudentsByCourse(String courseId) =>
      students.where((s) => s.enrolledCourses.contains(courseId)).toList();

  List<Course> getAvailableCoursesForStudent(String studentId) {
    final student = findStudentById(studentId);
    if (student == null) return [];
    return courses
        .where((c) => c.canStudentEnroll(student))
        .where((c) => !student.enrolledCourses.contains(c.id))
        .toList();
  }

  Map<String, dynamic> generateStatistics() {
    double avgGpa = students.isEmpty
        ? 0
        : students.map((s) => s.gpa).reduce((a, b) => a + b) / students.length;
    return {
      "totalStudents": students.length,
      "totalProfessors": professors.length,
      "totalCourses": courses.length,
      "averageGPA": avgGpa
    };
  }
}
