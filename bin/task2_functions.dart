void main() {
  print('=== Dart Functions Demo ===\n');

  testBasicFunctions();
  testAdvancedFunctions();
  testFunctionalProgramming();
}

void testBasicFunctions() {
  print('--- Basic Functions ---');
  print('Sum(5, 7) = ${calculateSum(5, 7)}');
  print('Average([1.5, 2.5, 3.5]) = ${calculateAverage([1.5, 2.5, 3.5])}\n');
}

void testAdvancedFunctions() {
  print('--- Advanced Functions ---');
  print(formatName("Nikita", "Biloshytskyi"));
  print(formatName("Nikita", "Biloshytskyi", middleName: "Ivanovych"));
  print(formatName("Nikita", "Biloshytskyi", uppercase: true));

  print('Fibonacci(6) = ${fibonacci(6)}');
  print('Factorial(5) = ${factorial(5)}\n');
}

int calculateSum(int a, int b) => a + b;

double calculateAverage(List<double> numbers) {
  if (numbers.isEmpty) return 0;
  double sum = numbers.reduce((a, b) => a + b);
  return sum / numbers.length;
}

String formatName(String firstName, String lastName,
    {String? middleName, bool uppercase = false}) {
  String full = middleName == null
      ? "$firstName $lastName"
      : "$firstName $middleName $lastName";
  return uppercase ? full.toUpperCase() : full;
}

void testFunctionalProgramming() {
  print('--- Functional Programming ---');

  List<int> nums = [1, 2, 3, 4, 5];
  var squares = nums.map((n) => n * n).toList();
  print('Squares: $squares');

  var evens = nums.where((n) => n % 2 == 0).toList();
  print('Evens: $evens');

  int sum = nums.fold(0, (a, b) => a + b);
  print('Sum with fold: $sum');

  Function makeMultiplier(int factor) {
    return (int x) => x * factor;
  }

  var triple = makeMultiplier(3);
  print('Triple of 4 = ${triple(4)}\n');
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}
