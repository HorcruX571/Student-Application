class Assignment {
  final int id;
  final DateTime dueDate;
  final String topic;
  final String subject;
  final int numQuestions;
  final int teacherId;
  final String teacherName;
  bool submitted;

  Assignment({
    required this.id,
    required this.dueDate,
    required this.topic,
    required this.subject,
    required this.numQuestions,
    required this.teacherId,
    required this.teacherName,
    this.submitted = false,
  });
}

List<Assignment> assignments = [
  Assignment(
    id: 1,
    dueDate: DateTime(2024, 6, 30),
    topic: 'Assignment 1',
    subject: 'Mathematics',
    numQuestions: 5,
    teacherId: 101,
    teacherName: 'Dr. Smith',
  ),
  Assignment(
    id: 2,
    dueDate: DateTime(2024, 7, 5),
    topic: 'Assignment 2',
    subject: 'Physics',
    numQuestions: 4,
    teacherId: 102,
    teacherName: 'Dr. Johnson',
  ),
  Assignment(
    id: 3,
    dueDate: DateTime(2024, 7, 10),
    topic: 'Assignment 3',
    subject: 'Chemistry',
    numQuestions: 6,
    teacherId: 103,
    teacherName: 'Dr. Lee',
  ),
  Assignment(
    id: 4,
    dueDate: DateTime(2024, 7, 15),
    topic: 'Assignment 4',
    subject: 'Biology',
    numQuestions: 5,
    teacherId: 104,
    teacherName: 'Dr. Taylor',
  ),
  Assignment(
    id: 5,
    dueDate: DateTime(2024, 7, 20),
    topic: 'Assignment 5',
    subject: 'History',
    numQuestions: 3,
    teacherId: 105,
    teacherName: 'Dr. Anderson',
  ),
  Assignment(
    id: 6,
    dueDate: DateTime(2024, 7, 25),
    topic: 'Assignment 6',
    subject: 'Geography',
    numQuestions: 4,
    teacherId: 106,
    teacherName: 'Dr. Thomas',
  ),
  Assignment(
    id: 7,
    dueDate: DateTime(2024, 7, 30),
    topic: 'Assignment 7',
    subject: 'English',
    numQuestions: 5,
    teacherId: 107,
    teacherName: 'Dr. Martinez',
  ),
  Assignment(
    id: 8,
    dueDate: DateTime(2024, 8, 5),
    topic: 'Assignment 8',
    subject: 'Computer Science',
    numQuestions: 6,
    teacherId: 108,
    teacherName: 'Dr. Davis',
  ),
  Assignment(
    id: 9,
    dueDate: DateTime(2024, 8, 10),
    topic: 'Assignment 9',
    subject: 'Physical Education',
    numQuestions: 3,
    teacherId: 109,
    teacherName: 'Dr. Wilson',
  ),
  Assignment(
    id: 10,
    dueDate: DateTime(2024, 8, 15),
    topic: 'Assignment 10',
    subject: 'Art',
    numQuestions: 4,
    teacherId: 110,
    teacherName: 'Dr. White',
  ),
  Assignment(
    id: 11,
    dueDate: DateTime(2024, 6, 15),
    topic: 'Assignment 10',
    subject: 'Mathematics',
    numQuestions: 4,
    teacherId: 101,
    teacherName: 'Dr. Smith',
  ),
];
