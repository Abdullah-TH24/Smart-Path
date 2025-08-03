class BookModel {
  final int bookId;
  final String title;
  final String author;
  final String category;
  final String publisher;
  final String serialNumber;
  final String shelfLocation;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String?> bookStatus;

  BookModel({
    required this.bookId,
    required this.title,
    required this.author,
    required this.category,
    required this.publisher,
    required this.serialNumber,
    required this.shelfLocation,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.bookStatus,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json['book_id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      publisher: json['publisher'],
      serialNumber: json['serrial_number'],
      shelfLocation: json['shelf_location'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      bookStatus: List<String?>.from(json['book_status']),
    );
  }
}
