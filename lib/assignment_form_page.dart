import 'package:flutter/material.dart';
import 'assignment.dart';

class AssignmentFormPage extends StatefulWidget {
  final Assignment assignment;

  const AssignmentFormPage({Key? key, required this.assignment})
      : super(key: key);

  @override
  _AssignmentFormPageState createState() => _AssignmentFormPageState();
}

class _AssignmentFormPageState extends State<AssignmentFormPage> {
  late List<TextEditingController> _answerControllers;

  @override
  void initState() {
    super.initState();
    _answerControllers = List.generate(
      widget.assignment.numQuestions,
      (index) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    _answerControllers.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dueDate = widget.assignment.dueDate;
    final daysLeft = _calculateDaysLeft(dueDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Due Date: ${_getFormattedDate(dueDate)}',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '$daysLeft days left',
              style: TextStyle(
                  color: daysLeft <= 3 ? Colors.red : Colors.black,
                  fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Topic: ${widget.assignment.topic}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'Subject: ${widget.assignment.subject}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.assignment.numQuestions,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Question ${index + 1}'),
                      TextField(
                        controller: _answerControllers[index],
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Write your answer here',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.assignment.submitted = true;
                  });
                  _showSubmissionDialog(context);
                },
                child: Text('Submit'),
              ),
            ),
          ],
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
    final today = DateTime.now();
    final difference = dueDate.difference(today).inDays + 1;
    return difference;
  }

  Future<void> _showSubmissionDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submission Status'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your assignment has been submitted successfully.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
