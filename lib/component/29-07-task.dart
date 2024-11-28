import 'package:flutter/material.dart';

import '../oop_task/task_1_book.dart';
import '../oop_task/task_2_student.dart';
import '../oop_task/task_3_BankAccount.dart';
import '../oop_task/task_4_product.dart';

class dayWiseTask extends StatefulWidget {
  const dayWiseTask({super.key});

  @override
  State<dayWiseTask> createState() => _dayWiseTaskState();
}

class _dayWiseTaskState extends State<dayWiseTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("29/07/2024"),
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Task 1 Book'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Task 2 Student'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentScreen(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Task 3 BankAccount'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BankAccountPage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Task 4 Product'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
