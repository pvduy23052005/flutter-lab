# flutter_lab_2

A Flutter application for TLU Student Profile management and Honor Roll evaluation.

# BẢNG YÊU CẦU TODO BẮT BUỘC - LAB 02

## TODO 1 (Cơ bản - Yêu cầu bắt buộc)
**Mô tả yêu cầu:**
Bổ sung thuộc tính `_trainingScore` (Điểm rèn luyện — kiểu `int`, thang 100) vào lớp `CampusStudent`. Viết getter `trainingScore` và setter kiểm tra tính hợp lệ (`0 <= _trainingScore <= 100`, nếu ngoài vùng này phải throw `ArgumentError`).

**Giải pháp:**
- Khai báo thuộc tính private `int _trainingScore;` trong class `CampusStudent`.
- Viết getter `int get trainingScore => _trainingScore;`.
- Viết setter `set trainingScore(int value)` để kiểm tra nếu `value < 0 || value > 100` sẽ khởi chạy `throw ArgumentError('Điểm rèn luyện phải từ 0 đến 100!');`.
- Ràng buộc tham số khởi tạo `trainingScore` trong Constructor đi qua Setter để đảm bảo dữ liệu hợp lệ ngay từ lúc tạo đối tượng.

---

## TODO 2 (Nâng cao - Thử thách chuyên sâu)
**Mô tả yêu cầu:**
Viết phương thức `String evaluateHonorRoll()` trả về danh hiệu tổng hợp giữa `gpa` và `trainingScore`:
- Nếu `gpa >= 3.6 && trainingScore >= 90` ➔ `"Sinh viên Xuất sắc toàn diện"`
- Nếu `gpa >= 3.2 && trainingScore >= 80` ➔ `"Sinh viên Giỏi"`
- Còn lại ➔ `"Sinh viên Đạt chuẩn"`
- Hiển thị danh hiệu này trực tiếp trên thẻ UI (`Lab02ProfileApp`).

**Giải pháp:**
- Thêm hàm `evaluateHonorRoll()` vào `CampusStudent` đánh giá đồng thời `gpa` và `_trainingScore`.
- Trong UI thẻ định danh `Lab02ProfileApp`, nhúng widget Container Badge hiển thị kết quả trả về từ `student.evaluateHonorRoll()`.

---

## Problems Solved

1. Tự động hóa việc đánh giá và xếp loại danh hiệu sinh viên dựa trên kết quả học tập và rèn luyện.
2. Ngăn chặn việc nhập sai lệch dữ liệu điểm rèn luyện không hợp lệ vào hệ thống.
3. Chuẩn hóa quy trình quản lý và tra cứu thông tin định danh sinh viên.
4. Cung cấp giao diện trực quan hỗ trợ sinh viên và nhà trường theo dõi thành tích cá nhân.
5. Đơn giản hóa công tác tổng hợp và xét duyệt điều kiện khen thưởng trong nhà trường.
