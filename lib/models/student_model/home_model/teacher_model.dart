
class TeacherModel {
  String? name;
  String? subjectName;

  TeacherModel({
    this.name,this.subjectName
  });

  TeacherModel.fromJson(Map<String, dynamic> json) {
    
    name = json['name'];
    subjectName = json['subjectName'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['subjectName'] = subjectName;
    return data;
  }
}
