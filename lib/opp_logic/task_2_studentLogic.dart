// Define the Student class with encapsulation
class Student {
  String _name;
  String _grade;

  Student(this._name, this._grade);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String name) => _name = name;

  // Getter for grade
  String get grade => _grade;

  // Setter for grade
  set grade(String grade) => _grade = grade;
}
