import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String studentName = "Swapnaneel Sarkar";
  final String registrationNo = "22BCB7051";
  final String address = "Cooch Behar, West Bengal";
  final String collegeName = "VIT-AP University";
  final String branch = "Computer Science and Business System";
  final String yearOfGraduation = "2026";
  final String phoneNumber = "8967853033";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                          'assets/profile_picture.png'), // Ensure you have a profile picture asset
                    ),
                    SizedBox(height: 10),
                    Text(
                      studentName,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildProfileItem(
                  context,
                  Icons.perm_identity,
                  "Registration No.",
                  registrationNo,
                  Colors.blue), // Example using Colors.blue as custom color
              _buildProfileItem(context, Icons.home, "Address", address,
                  Colors.green), // Example using Colors.green as custom color
              _buildProfileItem(
                  context,
                  Icons.school,
                  "College Name",
                  collegeName,
                  Colors.orange), // Example using Colors.orange as custom color
              _buildProfileItem(context, Icons.business, "Branch", branch,
                  Colors.purple), // Example using Colors.purple as custom color
              _buildProfileItem(
                  context,
                  Icons.date_range,
                  "Year of Graduation",
                  yearOfGraduation,
                  Colors.red), // Example using Colors.red as custom color
              _buildProfileItem(
                  context,
                  Icons.phone,
                  "Phone Number",
                  phoneNumber,
                  Colors.teal), // Example using Colors.teal as custom color
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(BuildContext context, IconData icon, String title,
      String content, Color color) {
    return Container(
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
            size: 30,
            color: color, // Use custom color here
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color, // Use custom color here
                ),
              ),
              SizedBox(height: 5),
              Text(
                content,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
