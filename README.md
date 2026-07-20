# Flutter Mobile Development - HK6

Repository lưu trữ và quản lý chuỗi bài thực hành (Lab) môn **Lập trình Di động với Flutter**.

- **Học kỳ:** Học kỳ 6 (HK6)

---

## 🏗️ Kiến trúc Tổng thể Kho lưu trữ (Project Architecture)

Kho lưu trữ này được thiết kế theo mô hình **Multi-Project Repository (Modular Monorepo)**. Trong đó, **mỗi thư mục con là một dự án Flutter hoàn chỉnh và độc lập**.

### Nguyên tắc Kiến trúc:
- **Độc lập hoàn toàn (Isolation):** Mỗi Lab sở hữu file `pubspec.yaml`, môi trường build, dependencies và cấu hình thiết bị (Android/iOS/Web) riêng biệt.
- **Tính đóng gói (Encapsulation):** Đảm bảo việc nâng cấp hoặc thay đổi mã nguồn tại một bài thực hành không ảnh hưởng đến các Lab khác.
- **Dễ dàng mở rộng (Scalability):** Dễ dàng bổ sung các dự án Lab mới theo tiến trình học tập mà không phá vỡ cấu trúc tổng thể.

```text
flutter/
├── README.md                 # Tài liệu hướng dẫn & Kiến trúc tổng thể kho lưu trữ
├── flutter-lab-1/            # Dự án Flutter - Lab 01: Giới thiệu & Cấu trúc ứng dụng
│   ├── lib/                  # Mã nguồn chính của Lab 01
│   ├── pubspec.yaml          # Quản lý thư viện & cấu hình Lab 01
│   └── README.md             # Báo cáo nội dung Lab 01
│
├── flutter_lab_2/            # Dự án Flutter - Lab 02: Quản lý Thẻ Sinh viên TLU
│   ├── lib/                  # Mã nguồn ứng dụng Lab 02 (main.dart)
│   ├── pubspec.yaml          # Quản lý thư viện & cấu hình Lab 02
│   └── README.md             # Báo cáo & Bảng Yêu cầu TODO Lab 02
│
└── ...                       # Các bài thực hành tiếp theo
```

---

## 📚 Danh sách Bài thực hành (Lab Overview)

| Bài thực hành | Thư mục Dự án | Nội dung & Tính năng chính |
| :--- | :--- | :--- |
| **Lab 01** | `flutter-lab-1/` | Khởi tạo dự án Flutter cơ bản, tìm hiểu cây Widget và luồng chạy ứng dụng. |
| **Lab 02** | `flutter_lab_2/` | Xây dựng Thẻ định danh sinh viên TLU, đóng gói dữ liệu đối tượng `CampusStudent`, kiểm soát Điểm rèn luyện hợp lệ (0 - 100) và xếp loại danh hiệu trực tiếp trên UI. |

---

## 🚀 Hướng dẫn Chạy Dự án (Getting Started)

Do mỗi dự án Lab nằm ở một thư mục riêng biệt, bạn cần di chuyển vào đúng thư mục của Lab muốn chạy:

### 1. Di chuyển vào thư mục bài thực hành
```bash
# Ví dụ: Chạy bài thực hành Lab 02
cd flutter_lab_2
```

### 2. Cài đặt các gói phụ thuộc (Dependencies)
```bash
flutter pub get
```

### 3. Khởi chạy ứng dụng
```bash
flutter run
```

---

## 🛠️ Yêu cầu Môi trường (Prerequisites)

- **Flutter SDK:** `>=3.0.0`
- **Dart SDK:** `>=3.0.0`
- **IDE:** Visual Studio Code / Android Studio / IntelliJ IDEA (đã cài Flutter & Dart plugin)
