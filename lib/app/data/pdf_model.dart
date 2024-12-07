class PdfModel {
  String id;
  String name;
  int total_Discussions;
  int total_Followers;
  String importance;

  PdfModel({
    required this.id,
    required this.name,
    required this.total_Discussions,
    required this.total_Followers,
    required this.importance,
  });

  factory PdfModel.fromJson(Map<String, dynamic> json) {
    return PdfModel(
        id: json['id'],
        name: json['name'],
        total_Discussions: json['total_Discussions'],
        total_Followers: json['total_Followers'],
        importance: json['importance']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'total_Discussions': total_Discussions,
      'total_Followers': total_Followers,
      'importance': importance
    };
  }
}
