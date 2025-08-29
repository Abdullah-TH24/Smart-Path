class GradesModel {
  String? subjectName;
  int? minMark;
  int? maxMark;
  String? result;

  GradesModel({this.subjectName, this.minMark, this.maxMark, this.result});

  GradesModel.fromJson(Map<String, dynamic> json) {
    subjectName = json['subject_name'];
    minMark = json['min-mark'];
    maxMark = json['max-mark'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject_name'] = subjectName;
    data['min-mark'] = minMark;
    data['max-mark'] = maxMark;
    data['result'] = result;
    return data;
  }
}
