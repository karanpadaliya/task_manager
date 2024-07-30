import 'package:flutter/material.dart';

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

class StudentScreen extends StatefulWidget {
  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _gradeController = TextEditingController();
  Student _student = Student('Karan Padaliya', 'A+');

  @override
  void initState() {
    super.initState();
    _nameController.text = _student.name;
    _gradeController.text = _student.grade;
  }

  void _updateStudent() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _student.name = _nameController.text;
        _student.grade = _gradeController.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              """2) Create a Flutter application that includes a class Student with private attributes name
and grade. Use encapsulation to provide public methods to access and modify these
attributes. Display the student's information on the screen and allow the user to update
it via a form.
""",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              'Student Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text('Name: ${_student.name}'),
            Text('Grade: ${_student.grade}'),
            SizedBox(height: 32),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _gradeController,
                    decoration: InputDecoration(labelText: 'Grade'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a grade';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _updateStudent,
                    child: Text('Update Info'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
