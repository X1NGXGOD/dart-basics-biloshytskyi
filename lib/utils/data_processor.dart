import '../models/student.dart';
import '../models/university.dart';

class DataProcessor {
  // Lists
  static List<int> filterEvenNumbers(List<int> numbers) {
    return numbers.where((n) => n % 2 == 0).toList();
  }

  static Map<String, int> countWords(String text) {
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty);
    final Map<String, int> counts = {};
    for (var w in words) {
      counts[w] = (counts[w] ?? 0) + 1;
    }
    return counts;
  }

  static List<Map<String, dynamic>> sortStudentsByGPA(List<Student> students) {
    var sorted = [...students];
    sorted.sort((a, b) => b.gpa.compareTo(a.gpa));
    return sorted
        .map((s) => {"id": s.id, "name": s.fullName, "gpa": s.gpa})
        .toList();
  }

  // Sets
  static Set<String> getUniqueSkills(List<Student> students) {
    final Set<String> skills = {};
    for (var s in students) {
      if (s.toJson().containsKey("skills")) {
        skills.addAll(List<String>.from(s.toJson()["skills"]));
      }
    }
    return skills;
  }

  static Set<String> findCommonCourses(List<Student> students) {
    if (students.isEmpty) return {};
    Set<String> common = students.first.enrolledCourses.toSet();
    for (var s in students.skip(1)) {
      common = common.intersection(s.enrolledCourses.toSet());
    }
    return common;
  }

  // Maps
  static Map<String, List<Student>> groupStudentsByYear(List<Student> students) {
    final Map<String, List<Student>> groups = {};
    for (var s in students) {
      String year = s.birthDate.year.toString();
      groups.putIfAbsent(year, () => []);
      groups[year]!.add(s);
    }
    return groups;
  }

  static Map<String, double> calculateAverageGradesByCourse(
      List<Student> students) {
    final Map<String, List<double>> courseGrades = {};
    for (var s in students) {
      s.grades.forEach((course, grade) {
        courseGrades.putIfAbsent(course, () => []);
        courseGrades[course]!.add(grade);
      });
    }
    return courseGrades.map(
        (course, grades) => MapEntry(course, grades.reduce((a, b) => a + b) / grades.length));
  }

  // Advanced
  static List<Map<String, dynamic>> generateReport(University university) {
    return university.students
        .map((s) => {
              "id": s.id,
              "name": s.fullName,
              "GPA": s.gpa,
              "passedCourses": s.getPassedCourses()
            })
        .toList();
  }
}
