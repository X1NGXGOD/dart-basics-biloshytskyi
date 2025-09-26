import 'dart:io';
import 'dart:convert';
import 'package:dart_basics_biloshickii/models/student.dart';

void main() async {
  print('=== Dart Async Programming Demo ===\n');

  await demonstrateFutures();
  await demonstrateStreams();
  await demonstrateFileOperations();
}

// Симуляція API-запиту
Future<String> fetchStudentData(String studentId) async {
  await Future.delayed(Duration(seconds: 1));
  return "Student data for $studentId";
}

// Завантаження з файлу
Future<List<Student>> loadStudentsFromFile(String filename) async {
  try {
    final file = File(filename);
    if (!await file.exists()) return [];
    final content = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(content);
    return jsonData.map((e) => Student.fromJson(e)).toList();
  } catch (e) {
    print("Error loading file: $e");
    return [];
  }
}

// Запис у файл
Future<void> saveStudentsToFile(List<Student> students, String filename) async {
  final file = File(filename);
  final jsonData = students.map((s) => s.toJson()).toList();
  await file.writeAsString(jsonEncode(jsonData), mode: FileMode.write);
}

// Stream студентів
Stream<Student> studentStream() async* {
  var students = [
    Student(
        id: "S1",
        firstName: "Ivan",
        lastName: "Petrenko",
        birthDate: DateTime(2003)),
    Student(
        id: "S2",
        firstName: "Olga",
        lastName: "Ivanova",
        birthDate: DateTime(2004)),
  ];
  for (var s in students) {
    await Future.delayed(Duration(milliseconds: 500));
    yield s;
  }
}

// Демонстрація Futures
Future<void> demonstrateFutures() async {
  print('--- Futures ---');
  try {
    var results = await Future.wait([
      fetchStudentData("S1"),
      fetchStudentData("S2"),
    ]).timeout(Duration(seconds: 3));
    print("Results: $results\n");
  } catch (e) {
    print("Future error: $e\n");
  }
}

// Демонстрація Streams
Future<void> demonstrateStreams() async {
  print('--- Streams ---');
  await for (var s in studentStream()) {
    print("Received student: ${s.fullName}");
  }
  print("");
}

// Демонстрація File I/O
Future<void> demonstrateFileOperations() async {
  print('--- File Operations ---');

  var students = [
    Student(
        id: "S3",
        firstName: "Nikita",
        lastName: "Biloshytskyi",
        birthDate: DateTime(2004)),
    Student(
        id: "S4",
        firstName: "Oksana",
        lastName: "Shevchenko",
        birthDate: DateTime(2002)),
  ];

  await saveStudentsToFile(students, "students.json");
  print("Saved students.json");

  var loaded = await loadStudentsFromFile("students.json");
  print("Loaded students: ${loaded.map((s) => s.fullName).toList()}\n");
}
