import 'package:test/test.dart';
import 'package:dart_basics_biloshickii/models/student.dart';
import 'package:dart_basics_biloshickii/models/course.dart';
import 'package:dart_basics_biloshickii/models/university.dart';

void main() {
  group('Student tests', () {
    test('Full name and GPA calculation', () {
      var student = Student(
          id: "1",
          firstName: "Ivan",
          lastName: "Petrenko",
          birthDate: DateTime(2002));
      student.addGrade("C1", 80);
      student.addGrade("C2", 90);

      expect(student.fullName, equals("Ivan Petrenko"));
      expect(student.gpa, closeTo(85, 0.01));
    });

    test('Passed courses filter', () {
      var student = Student(
          id: "2",
          firstName: "Olga",
          lastName: "Ivanova",
          birthDate: DateTime(2003));
      student.addGrade("C1", 55);
      student.addGrade("C2", 75);

      expect(student.getPassedCourses(), contains("C2"));
      expect(student.getPassedCourses(), isNot(contains("C1")));
    });
  });

  group('Course tests', () {
    test('Check prerequisites', () {
      var student = Student(
          id: "3",
          firstName: "Nikita",
          lastName: "Biloshytskyi",
          birthDate: DateTime(2004),
          enrolledCourses: ["C1"]);

      var course = Course(
          id: "C2",
          name: "Advanced",
          description: "Test",
          credits: 5,
          instructor: "Teacher",
          prerequisites: ["C1"]);

      expect(course.canStudentEnroll(student), isTrue);
    });
  });

  group('University tests', () {
    test('Add and find student', () {
      var uni = University(name: "MNTU");
      var student = Student(
          id: "4",
          firstName: "Oksana",
          lastName: "Shevchenko",
          birthDate: DateTime(2001));
      uni.addStudent(student);

      expect(uni.findStudentById("4")?.fullName, equals("Oksana Shevchenko"));
    });
  });
}
