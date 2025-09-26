void main() {
  print('=== Dart Variables & Types Demo ===\n');

  demonstrateNumbers();
  demonstrateStrings();
  demonstrateBooleans();
  demonstrateCollections();
  demonstrateNullSafety();
}

void demonstrateNumbers() {
  print('--- Numbers ---');
  int a = 10;
  double b = 3.14;
  num c = a + b;

  print('int: $a');
  print('double: $b');
  print('num: $c');

  int sum = a + 5;
  double div = b / 2;
  print('Sum: $sum');
  print('Division: $div');

  String converted = a.toString();
  int parsed = int.parse("42");
  print('Converted int to string: $converted');
  print('Parsed string to int: $parsed\n');
}

void demonstrateStrings() {
  print('--- Strings ---');
  String first = "Hello";
  String second = "World";
  String combined = "$first $second";

  print('Concatenation: $combined');
  print('Uppercase: ${combined.toUpperCase()}');
  print('Substring: ${combined.substring(0, 5)}');

  String multi = '''
This is
a multi-line
string.
''';
  print(multi);

  String escaped = "Line1\nLine2\tTabbed";
  print("$escaped\n");
}

void demonstrateBooleans() {
  print('--- Booleans ---');
  bool isActive = true;
  bool isEqual = (5 == 5);
  bool isGreater = (10 > 3);

  print('isActive: $isActive');
  print('isEqual: $isEqual');
  print('isGreater: $isGreater');

  String result = isActive ? "Active" : "Inactive";
  print('Ternary result: $result\n');
}

void demonstrateCollections() {
  print('--- Collections ---');
  List<int> numbers = [1, 2, 3];
  numbers.add(4);
  print('List: $numbers');

  Set<String> fruits = {"apple", "banana", "apple"};
  print('Set (unique): $fruits');

  Map<String, int> scores = {"Alice": 90, "Bob": 75};
  scores["Charlie"] = 82;
  print('Map: $scores\n');
}

void demonstrateNullSafety() {
  print('--- Null Safety ---');
  String? nullableString;
  print('Nullable: $nullableString');

  nullableString = "Hello Null Safety";
  print('Now: $nullableString');

  String nonNull = nullableString ?? "Default Value";
  print('Null-coalescing: $nonNull');

  late int lateValue;
  lateValue = 100;
  print('Late variable: $lateValue\n');
}
