class BorrowUserModel {
  final String fullName;
  final String email;
  final String role;
  final String className;

  BorrowUserModel({
    required this.fullName,
    required this.email,
    required this.role,
    required this.className,
  });

  factory BorrowUserModel.fromJson(Map<String, dynamic> json) {
    return BorrowUserModel(
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      className: json['class'] ?? '',
    );
  }
}
