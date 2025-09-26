import 'package:dart_basics_biloshickii/utils/data_processor.dart';
import 'package:dart_basics_biloshickii/models/student.dart';
import 'package:dart_basics_biloshickii/models/university.dart';

void main() {
  print('=== Dart Collections & Data Processing Demo ===\n');

  demonstrateLists();
  demonstrateSets();
  demonstrateMaps();
  demonstrateAdvancedOperations();
}

void demonstrateLists() {
  print('--- Lists ---');
  List<int> nums = [1, 2, 3, 4, 5, 6];
  print('Original: $nums');
  print('Even: ${DataProcessor.filterEvenNumbers(nums)}\n');
}

void demonstrateSets() {
  print('--- Sets ---');
  var s1 = Student(
      id: "1",
      firstName: "A",
      lastName: "B",
      birthDate: DateTime(2000),
      enrolledCourses: ["C1", "C2"]);
  var s2 = Student(
      id: "2",
      firstName: "C",
      lastName: "D",
      birthDate: DateTime(2001),
      enrolledCourses: ["C2", "C3"]);
  print('Common courses: ${DataProcessor.findCommonCourses([s1, s2])}\n');
}

void demonstrateMaps() {
  print('--- Maps ---');
  var s1 = Student(
    id: "S1",
    firstName: "Ivan",
    lastName: "Petrenko",
    birthDate: DateTime(2002),
    grades: {"C1": 80, "C2": 70},
  );
  var s2 = Student(
    id: "S2",
    firstName: "Olga",
    lastName: "Ivanova",
    birthDate: DateTime(2003),
    grades: {"C1": 90, "C2": 60},
  );
  var avg = DataProcessor.calculateAverageGradesByCourse([s1, s2]);
  print('Average grades: $avg\n');
}

void demonstrateAdvancedOperations() {
  print('--- Advanced ---');
  var uni = University(name: "Demo");
  var s1 = Student(
      id: "1", firstName: "Nikita", lastName: "Biloshytskyi", birthDate: DateTime(2004));
  s1.addGrade("C1", 85);
  var s2 = Student(
      id: "2", firstName: "Ivan", lastName: "Petrenko", birthDate: DateTime(2003));
  s2.addGrade("C1", 55);
  uni.addStudent(s1);
  uni.addStudent(s2);

  var report = DataProcessor.generateReport(uni);
  print('Report: $report\n');
}
