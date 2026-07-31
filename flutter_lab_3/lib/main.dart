import 'package:flutter/material.dart';

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
    print("Đã kích hoạt hàm _handleCardClick!");
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Đã bấm nút')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab 3 - UI & Interaction"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  gradient: LinearGradient(
                    colors: [Colors.lightGreen, Colors.green],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
                padding: EdgeInsets.all(2),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 196, 49, 49),
                      ),
                      child: const Text(
                        "Hello Duy, đoạn chat này nằm trên cùng 1 hàng với Avatar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                clipBehavior: Clip
                    .antiAlias, // Giúp hiệu ứng gợn sóng không bị tràn ra ngoài góc bo tròn
                child: InkWell(
                  onTap: () => _handleClick(context),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Click vào chiếc Card này'),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => _handleClick(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: const Text('ĐĂNG NHẬP'),
              ),

              ElevatedButton(
                onPressed: () => _handleClick(context),
                child: const Text("Click me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
