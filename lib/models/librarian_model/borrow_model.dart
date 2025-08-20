import 'package:smartpath/models/librarian_model/borrow_user_model.dart';

class BorrowModel {
  final int id;
  final int userId;
  final int bookId;
  final String title;
  final String author;
  final String category;
  final String publisher;
  final String shelfLocation;
  final String? description;
  final String serrialNumber;
  final String borrowStatus;
  final DateTime? borrowDate;
  final DateTime? dueDate;
  final DateTime? returnedDate;
  final String? bookStatus;
  final String? notes;
  final BorrowUserModel borrower;

  BorrowModel({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.title,
    required this.author,
    required this.category,
    required this.publisher,
    required this.shelfLocation,
    this.description,
    required this.serrialNumber,
    required this.borrowStatus,
    this.borrowDate,
    this.dueDate,
    this.returnedDate,
    this.bookStatus,
    this.notes,
    required this.borrower,
  });

  factory BorrowModel.fromJson(Map<String, dynamic> json) {
    return BorrowModel(
      id: json['id'],
      userId: json['user_id'],
      bookId: json['book_id'],
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      category: json['category'] ?? '',
      publisher: json['publisher'] ?? '',
      shelfLocation: json['shelf_location'] ?? '',
      description: json['description'],
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
      borrower: BorrowUserModel.fromJson(json['borrower']),
    );
  }
}

class BorrowResponse {
  final bool status;
  final List<BorrowModel> message;

  BorrowResponse({required this.status, required this.message});

  factory BorrowResponse.fromJson(Map<String, dynamic> json) {
    return BorrowResponse(
      status: json['status'],
      message: List<BorrowModel>.from(
        json['message'].map((x) => BorrowModel.fromJson(x)),
      ),
    );
  }
}
