class BookModel {
  final String title;
  final String author;
  final String category;
  final String publisher;
  final String serialNumber;
  final String shelfLocation;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  BookModel({
    required this.title,
    required this.author,
    required this.category,
    required this.publisher,
    required this.serialNumber,
    required this.shelfLocation,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'],
      author: json['author'],
      category: json['category'],
      publisher: json['publisher'],
      serialNumber: json['serrial_number'],
      shelfLocation: json['shelf_location'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
