class Reactions {
  int? reactionNumber;
  Map<String, int> types = {};

  Reactions({this.reactionNumber, Map<String, int>? types}) {
    if (types != null) {
      this.types = types;
    }
  }

  Reactions.fromJson(Map<String, dynamic> json) {
    reactionNumber = json['reaction_number'];
    final typesJson = json['types'];
    if (typesJson is Map<String, dynamic>) {
      types = typesJson.map((key, value) => MapEntry(key, value as int));
    } else {
      types = {};
    }
  }

  Map<String, dynamic> toJson() {
    return {'reaction_number': reactionNumber, 'types': types};
  }
}
