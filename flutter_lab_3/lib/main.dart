import 'package:flutter/material.dart';
import 'package:flutter_lab_3/ui/widget/course_card.dart';
import 'package:flutter_lab_3/ui/widget/custom_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab 03 - UI & Interaction',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const FlutterLab3(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FlutterLab3 extends StatelessWidget {
  const FlutterLab3({super.key});

  void _handleClick(BuildContext context) {
    print("Click ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "DANH MỤC HỌC PHẦN TLU",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: const Icon(Icons.menu),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TluVerifiedBadge(
                title: "TLU VERIFIED COURSES CATELOG 2026",
                description:
                    "Danh sách học phần được đồng bộ từ hệ thống quản lý đào tạo",
              ),
              CourseCard(
                courseCode: "SE301",
                title: "Kỹ thuật phần mềm",
                department: "CNTT",
                credits: 3,
                buttonColor: Colors.blue,
                onTap: () => _handleClick(context),
              ),
              CourseCard(
                courseCode: "SE302",
                title: "Lập trình web",
                department: "CNTT",
                credits: 3,
                buttonColor: Colors.orange,
                onTap: () => _handleClick(context),
              ),
              CourseCard(
                courseCode: "SE303",
                title: "Cấu trúc dữ liệu & giải thuật",
                department: "CNTT",
                credits: 3,
                buttonColor: Colors.green,
                isPrerequisite: true,
                onTap: () => _handleClick(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
