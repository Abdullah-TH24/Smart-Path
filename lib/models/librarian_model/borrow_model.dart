import 'package:smartpath/models/librarian_model/borrow_user_model.dart';

class BorrowModel {
  final int id;
  final int userId;
  final int bookId;
  final String serrialNumber;
  final String borrowStatus;
  final DateTime? borrowDate;
  final DateTime? dueDate;
  final DateTime? returnedDate;
  final String? bookStatus;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final BorrowUserModel user;

  BorrowModel({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.serrialNumber,
    required this.borrowStatus,
    this.borrowDate,
    this.dueDate,
    this.returnedDate,
    this.bookStatus,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory BorrowModel.fromJson(Map<String, dynamic> json) {
    return BorrowModel(
      id: json['id'],
      userId: json['user_id'],
      bookId: json['book_id'],
      serrialNumber: json['serrial_number'] ?? '',
      borrowStatus: json['borrow_status'] ?? '',
      borrowDate: json['borrow_date'] != null
          ? DateTime.tryParse(json['borrow_date'])
          : null,
      dueDate: json['due_date'] != null
          ? DateTime.tryParse(json['due_date'])
          : null,
      returnedDate: json['returned_date'] != null
          ? DateTime.tryParse(json['returned_date'])
          : null,
      bookStatus: json['book_status'],
      notes: json['notes'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      user: BorrowUserModel.fromJson(json['user']),
    );
  }
}
