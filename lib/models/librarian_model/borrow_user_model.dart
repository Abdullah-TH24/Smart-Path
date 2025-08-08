class BorrowUserModel {
  final int id;
  final String name;
  final String middleName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? pinCode;
  final String role;
  final DateTime createdAt;
  final DateTime updatedAt;

  BorrowUserModel({
    required this.id,
    required this.name,
    required this.middleName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.pinCode,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BorrowUserModel.fromJson(Map<String, dynamic> json) {
    return BorrowUserModel(
      id: json['id'],
      name: json['name'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      pinCode: json['pinCode'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
