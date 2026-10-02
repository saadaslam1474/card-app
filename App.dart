import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Campus Dashboard',
  home: DashboardScreen(),
));

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final note = TextEditingController();
  final name = 'Muhammad Saad Aslam';
  final rollNo = 'FA24-BSE-104';
  final department = 'Software Engineering';
  final semester = '5th';
  final courses = [
    'Mobile Application Development',
    'Database Systems',
    'Operating Systems',
    'Software Design and Architecture',
    'Probability and Statistics',
    'Technical Writing',
  ];

  // Neeche message dikhata hai
  void showMessage(String m) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));

  // Submit dabane par chalta hai
  void submitNote() {
    final text = note.text.trim();
    showMessage(text.isEmpty ? 'Please type something first' : 'Saved: $text');
    if (text.isNotEmpty) note.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showMessage('Search tapped'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(rollNo),
            ),
            const ListTile(leading: Icon(Icons.person), title: Text('My Profile')),
            const ListTile(leading: Icon(Icons.school), title: Text('Academic Record')),
            const ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 28,
                      child: Icon(Icons.person, size: 32),
                    ),
                    title: Text(name),
                    subtitle: Text(
                      'Roll No: $rollNo\n'
                          'Department: $department\n'
                          'Semester: $semester',
                    ),
                    isThreeLine: true,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Enrolled Courses',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                for (final course in courses)
                  Card(child: ListTile(title: Text(course))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: note,
                    decoration: const InputDecoration(
                      hintText: 'Write a quick note...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: submitNote, child: const Text('Submit')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}