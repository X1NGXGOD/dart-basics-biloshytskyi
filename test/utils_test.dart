import 'package:test/test.dart';
import 'package:dart_basics_biloshickii/utils/calculator.dart';
import 'package:dart_basics_biloshickii/utils/data_processor.dart';
import 'package:dart_basics_biloshickii/models/student.dart';
import 'package:dart_basics_biloshickii/models/university.dart';

void main() {
  group('Calculator tests', () {
    test('Basic operations', () {
      expect(Calculator.add(2, 3), equals(5));
      expect(Calculator.subtract(5, 2), equals(3));
      expect(Calculator.multiply(3, 4), equals(12));
      expect(Calculator.divide(10, 2), equals(5));
    });

    test('Division by zero throws error', () {
      expect(() => Calculator.divide(10, 0), throwsArgumentError);
    });
  });

  group('DataProcessor tests', () {
    test('Filter even numbers', () {
      expect(DataProcessor.filterEvenNumbers([1, 2, 3, 4]), equals([2, 4]));
    });

    test('Word count', () {
      var text = "Hello world hello";
      var counts = DataProcessor.countWords(text);
      expect(counts["hello"], equals(2));
      expect(counts["world"], equals(1));
    });

    test('Report generation', () {
      var uni = University(name: "MNTU");
      var s1 = Student(
          id: "1", firstName: "Ivan", lastName: "Petrenko", birthDate: DateTime(2002));
      s1.addGrade("C1", 80);
      uni.addStudent(s1);

      var report = DataProcessor.generateReport(uni);
      expect(report.first["GPA"], equals(80));
    });
  });
}
