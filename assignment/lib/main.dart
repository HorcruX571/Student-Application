import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_page.dart';
import 'time_table_page.dart';
import 'exam_schedule_page.dart';
import 'marks_page.dart';
import 'assignment_upload_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        cardColor: Colors.blue[50],
        colorScheme: ColorScheme.light(
            secondary: Colors.blue), // Adjust brightness to light
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black),
          titleLarge: TextStyle(color: Colors.black),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: Colors.grey[800],
        colorScheme: ColorScheme.dark(
            secondary: Colors.blue), // Adjust brightness to dark
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.system,
      home: StudentHomePage(),
    );
  }
}

class StudentHomePage extends StatelessWidget {
  final String studentName = "Swapnaneel Sarkar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Developers',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10), // Add spacing
            buildDeveloperItem(
              context,
              'Shiladitya Das',
              'NIT Bhopal',
              'B.Tech in Materials & Metallurgical Engineering, 2027',
              'https://www.linkedin.com/in/shiladitya070/',
            ),
            SizedBox(height: 10), // Add spacing
            buildDeveloperItem(
              context,
              'Daipayan Guha Neogi',
              'VIT Vellore',
              'Electrical Computer Engineering, 2027',
              'https://www.linkedin.com/in/daipayan-neogi-443abb24b/',
            ),
            SizedBox(height: 10), // Add spacing
            buildDeveloperItem(
              context,
              'Swapnaneel Sarkar',
              'VIT AP',
              'Computer Science and Business System, 2026',
              'https://www.linkedin.com/in/swapnaneel-sarkar-20a73721a/',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    studentName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildFunctionBox(
                    context,
                    'Time Table',
                    Icons.calendar_today,
                    TimeTablePage(),
                  ),
                  _buildFunctionBox(
                    context,
                    'Exam Schedule',
                    Icons.schedule,
                    ExamSchedulePage(),
                  ),
                  _buildFunctionBox(
                    context,
                    'Marks',
                    Icons.grade,
                    MarksPage(),
                  ),
                  _buildFunctionBox(
                    context,
                    'Assignment',
                    Icons.upload_file,
                    AssignmentUploadPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFunctionBox(
      BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 40,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeveloperItem(BuildContext context, String name, String college,
      String branchAndGraduation, String linkedinUrl) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('College: $college'),
              Text(branchAndGraduation),
            ],
          ),
          trailing: GestureDetector(
            onTap: () async {
              await launch(linkedinUrl);
            },
            child: Icon(
              Icons.link,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        Divider(), // Add a divider
      ],
    );
  }
}
