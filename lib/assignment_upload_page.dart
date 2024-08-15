import 'package:flutter/material.dart';
import 'assignment.dart';
import 'assignment_form_page.dart';

class AssignmentUploadPage extends StatefulWidget {
  @override
  _AssignmentUploadPageState createState() => _AssignmentUploadPageState();
}

class _AssignmentUploadPageState extends State<AssignmentUploadPage> {
  String _selectedSubject = 'All Subjects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Upload'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedSubject,
              items: [
                'All Subjects',
                'Mathematics',
                'Physics',
                'Chemistry',
                'Biology',
                'History',
                'Geography',
                'English',
                'Computer Science',
                'Physical Education',
                'Art'
              ]
                  .map((subject) => DropdownMenuItem(
                        value: subject,
                        child: Text(subject),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSubject = value!;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Subject',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: assignments
                    .where((assignment) =>
                        _selectedSubject == 'All Subjects' ||
                        assignment.subject == _selectedSubject)
                    .length,
                itemBuilder: (context, index) {
                  final filteredAssignments = assignments.where((assignment) =>
                      _selectedSubject == 'All Subjects' ||
                      assignment.subject == _selectedSubject);
                  final sortedAssignments = filteredAssignments.toList()
                    ..sort((a, b) => a.dueDate.compareTo(b.dueDate));
                  final assignment = sortedAssignments[index];
                  return AssignmentCard(assignment: assignment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final Assignment assignment;

  const AssignmentCard({Key? key, required this.assignment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysLeft = _calculateDaysLeft(assignment.dueDate);
    final daysLeftColor = daysLeft <= 3 ? Colors.red : Colors.black;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AssignmentFormPage(assignment: assignment),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(assignment.topic),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Subject: ${assignment.subject}'),
              Text(
                'Due Date: ${_getFormattedDate(assignment.dueDate)}',
              ),
              Text('Number of Questions: ${assignment.numQuestions}'),
              Text('Professor: ${assignment.teacherName}'),
              Text(
                'Days Left: $daysLeft',
                style: TextStyle(color: daysLeftColor),
              ),
            ],
          ),
          trailing: Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: assignment.submitted ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              assignment.submitted ? 'Submitted' : 'Pending',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    return '${_getMonthName(date.month)} ${date.day}, ${date.year}';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }

  int _calculateDaysLeft(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now).inDays + 1;
    return difference >= 0 ? difference : 0;
  }
}
