import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleStoragePage(),
    );
  }
}

class SimpleStoragePage extends StatefulWidget {
  const SimpleStoragePage({super.key});

  @override
  State<SimpleStoragePage> createState() => _SimpleStoragePageState();
}

class _SimpleStoragePageState extends State<SimpleStoragePage> {
  final TextEditingController _textController = TextEditingController();
  String _savedText = 'Đang tải dữ liệu...';

  @override
  void initState() {
    super.initState();
    // Đọc dữ liệu đã lưu khi vừa vào app
    _loadText();
  }

  // 1. Hàm ĐỌC văn bản từ SharedPreferences
  Future<void> _loadText() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        _savedText = prefs.getString('key-test') ?? 'Chưa có dữ liệu';
      });
    }
  }

  // 2. Hàm GHI (LƯU) văn bản vào SharedPreferences
  Future<void> _saveText() async {
    String textToSave = _textController.text.trim();
    if (textToSave.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập chữ trước khi bấm lưu!'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    // Đóng bàn phím mềm
    FocusScope.of(context).unfocus();

    // Lưu vào ổ đĩa
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('key-test', textToSave);

    if (mounted) {
      setState(() {
        _savedText = textToSave;
      });

      _textController.clear();

      // Thông báo thành công
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã lưu thành công: "$textToSave"'),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ví Dụ Lưu Text Thô'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Ô NHẬP LIỆU (LUÔN SẴN SÀNG ĐỂ GÕ)
            TextField(
              controller: _textController,
              enabled: true,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: const InputDecoration(
                labelText: 'Nhập văn bản vào đây...',
                hintText: 'Ví dụ: Nguyễn Văn A',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.edit),
              ),
            ),
            const SizedBox(height: 16),

            // NÚT LƯU
            ElevatedButton.icon(
              onPressed: _saveText,
              icon: const Icon(Icons.save),
              label: const Text(
                'LƯU VÀO THIẾT BỊ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 30),

            const Divider(thickness: 2),
            const SizedBox(height: 10),

            // KẾT QUẢ HIỂN THỊ
            const Text(
              'Dữ liệu hiện tại trong SharedPreferences:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade300),
              ),
              child: Text(
                _savedText,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
