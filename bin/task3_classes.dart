import 'package:dart_basics_biloshickii/models/student.dart';
import 'package:dart_basics_biloshickii/models/course.dart';
import 'package:dart_basics_biloshickii/models/university.dart';

void main() {
  print('=== University Management System Demo ===\n');
  runUniversityDemo();
}

void runUniversityDemo() {
  var uni = University(name: "MNTU");

  var student1 = Student(
    id: "S1",
    firstName: "Nikita",
    lastName: "Biloshytskyi",
    birthDate: DateTime(2004, 5, 20),
  );

  var student2 = Student(
    id: "S2",
    firstName: "Ivan",
    lastName: "Petrenko",
    birthDate: DateTime(2003, 3, 14),
  );

  var prof = Professor(
    id: "P1",
    firstName: "Olena",
    lastName: "Ivanova",
    birthDate: DateTime(1980, 6, 12),
    department: "CS",
    salary: 25000,
  );

  var course1 = Course(
      id: "C1",
      name: "Programming 101",
      description: "Intro to Dart",
      credits: 5,
      instructor: prof.fullName);

  var course2 = Course(
      id: "C2",
      name: "OOP",
      description: "Advanced OOP in Dart",
      credits: 5,
      instructor: prof.fullName,
      prerequisites: ["C1"]);

  uni.addStudent(student1);
  uni.addStudent(student2);
  uni.professors.add(prof);
  uni.courses.addAll([course1, course2]);

  student1.enrollInCourse("C1");
  student1.addGrade("C1", 85);

  student2.enrollInCourse("C1");
  student2.addGrade("C1", 55);

  print("Students: ${uni.students}");
  print("Professors: ${uni.professors.map((p) => p.fullName).toList()}");
  print("Courses: ${uni.courses.map((c) => c.name).toList()}");
  print("Passed by ${student1.fullName}: ${student1.getPassedCourses()}");
  print("Stats: ${uni.generateStatistics()}");
}
