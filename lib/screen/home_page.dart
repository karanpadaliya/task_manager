import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_task/component/29-07-task.dart';
import 'package:my_task/screen/task_page.dart';

import '../oop_task/task_1_book.dart';
import '../oop_task/task_2_student.dart';
import '../oop_task/task_3_BankAccount.dart';
import '../oop_task/task_4_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _tasks = [];
  final List<String> _completedTasks = [];
  final TextEditingController _controller = TextEditingController();

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add(_controller.text);
        _controller.clear();
      });
    }
    Navigator.of(context).pop();
  }

  void _updateTask(int index) {
    _controller.text = _tasks[index];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Task"),
          content: TextField(
            textCapitalization: TextCapitalization.words,
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter new task"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  setState(() {
                    _tasks[index] = _controller.text;
                    _controller.clear();
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Update"),
            ),
          ],
        );
      },
    );
  }

  void _completeTask(int index) {
    setState(() {
      _completedTasks.add(_tasks.removeAt(index));
    });
  }

  void _deleteCompletedTask(int index) {
    setState(() {
      _completedTasks.removeAt(index);
    });
  }

  void _showCompletedTasks() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Completed Tasks",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _completedTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: ListTile(
                            title: Text(
                              _completedTasks[index],
                              style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.grey,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setModalState(() {
                                  _deleteCompletedTask(index);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Task"),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Enter a task"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: _addTask,
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.checkmark_rectangle_fill,
              color: Colors.green,
            ),
            onPressed: _showCompletedTasks,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Task Manager',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Manage your tasks efficiently!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
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
            Divider(),
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Add Task'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _showAddTaskDialog();
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('View Tasks'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the task page (if needed)
                // For now, we are already on the task page, so this may not be necessary
              },
            ),
            ListTile(
              leading: const Icon(Icons.done_all),
              title: const Text('Completed Tasks'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _showCompletedTasks();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Expanded(child: dayWiseTask()),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      title: Text(_tasks[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDetailsPage(task: _tasks[index]),
                          ),
                        );
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _updateTask(index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () => _completeTask(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
