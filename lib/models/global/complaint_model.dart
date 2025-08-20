class ComplaintModel {
  final int id;
  final int userId;
  final String complaint;
  final String category;
  final String status;
  final String priority;
  final String? notes;
  final String? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  ComplaintModel({
    required this.id,
    required this.userId,
    required this.complaint,
    required this.category,
    required this.status,
    required this.priority,
    this.notes,
    this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      id: json['id'],
      userId: json['user_id'],
      complaint: json['complaint'],
      category: json['category'],
      status: json['status'],
      priority: json['priority'],
      notes: json['notes'],
      deletedAt: json['deleted_at'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
