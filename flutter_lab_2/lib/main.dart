import 'package:flutter/material.dart';

void main() => runApp(const Lab02ProfileApp());

class CampusStudent {
  final String id;
  final String name;
  final String faculty;
  final String major;
  final String email;
  final String phone;
  final double gpa;

  int _trainingScore;

  CampusStudent({
    required this.id,
    required this.name,
    required this.faculty,
    required this.major,
    required this.email,
    required this.phone,
    required this.gpa,
    required int trainingScore,
  }) : _trainingScore = 0 {
    this.trainingScore = trainingScore;
  }

  int get trainingScore => _trainingScore;

  set trainingScore(int value) {
    if (value < 0 || value > 100) {
      throw ArgumentError('Điểm rèn luyện phải từ 0 đến 100!');
    }
    _trainingScore = value;
  }
}

class Lab02ProfileApp extends StatelessWidget {
  const Lab02ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TLU Student Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const CampusProfileScreen(),
    );
  }
}

class CampusProfileScreen extends StatefulWidget {
  const CampusProfileScreen({super.key});

  @override
  State<CampusProfileScreen> createState() => _CampusProfileScreenState();
}

class _CampusProfileScreenState extends State<CampusProfileScreen> {
  late CampusStudent student;

  @override
  void initState() {
    super.initState();
    student = CampusStudent(
      id: '2351170589',
      name: 'Phùng Văn Duy',
      faculty: 'Khoa Công nghệ Thông tin - TLU',
      major: 'Kỹ thuật Phần mềm Mobile',
      email: '2351170589@tlu.edu.vn',
      phone: '0332136985',
      gpa: 3.2,
      trainingScore: 79,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'THẺ ĐỊNH DANH SINH VIÊN TLU',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 54,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.school_rounded,
                            size: 64,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        student.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        student.faculty,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.amber.shade600),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.workspace_premium_rounded,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "Xếp loại sinh viên",
                              style: TextStyle(
                                color: Colors.amber.shade900,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              _buildInfoTile(
                Icons.badge_rounded,
                'Mã sinh viên',
                student.id,
                Colors.blue,
              ),
              _buildInfoTile(
                Icons.class_rounded,
                'Chuyên ngành',
                student.major,
                Colors.orange,
              ),
              _buildInfoTile(
                Icons.auto_graph_rounded,
                'Kết quả học tập & Rèn luyện',
                'GPA: ${student.gpa} | ĐRL: ${student.trainingScore}/100',
                Colors.indigo,
              ),
              _buildInfoTile(
                Icons.email_rounded,
                'Email trường',
                student.email,
                Colors.teal,
              ),
              _buildInfoTile(
                Icons.phone_android_rounded,
                'Số điện thoại',
                student.phone,
                Colors.purple,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
        subtitle: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
