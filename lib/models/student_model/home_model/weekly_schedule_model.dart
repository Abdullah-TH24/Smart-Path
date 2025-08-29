class WeeklyScheduleModel {
  final String? subject;
  final String? session;
  final int? cancelled;
  final String? day;
  final String? semester;
  final String? year;

  WeeklyScheduleModel({
    required this.subject,
    required this.session,
    required this.cancelled,
    required this.day,
    required this.semester,
    required this.year,
  });

  static WeeklyScheduleModel fromMap(Map map) {
    return WeeklyScheduleModel(
      subject: map['subject'],
      session: map['session'],
      cancelled: map['cancelled'],
      day: map['day'],
      semester: map['semester'],
      year: map['year'],
    );
  }
}
