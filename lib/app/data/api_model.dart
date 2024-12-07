class DiscussionLists {
  String? pdfId;
  String? pdfName;
  int? pdfFollowerCount;
  String? pdfImportance;
  String? discussionId;
  String? title;
  String? metadata;
  String? body;
  String? likeCount;
  String? commentCount;
  String? createdOn;
  List<String>? img;
  String? source;
  String? ownerId;
  String? ownerImg;
  String? ownerName;
  String? ownerLevel;
  String? ownerLevelName;
  OwnerCategory? ownerCategory;
  LikedBy? likedBy;
  String? commentedBy;

  DiscussionLists({
    required this.pdfId,
    required this.pdfName,
    required this.pdfFollowerCount,
    required this.pdfImportance,
    required this.discussionId,
    required this.title,
    required this.metadata,
    required this.body,
    required this.likeCount,
    required this.commentCount,
    required this.createdOn,
    required this.img,
    required this.source,
    required this.ownerId,
    required this.ownerImg,
    required this.ownerName,
    required this.ownerLevel,
    required this.ownerLevelName,
    required this.ownerCategory,
    required this.likedBy,
    required this.commentedBy,
  });

  factory DiscussionLists.fromJson(Map<String, dynamic> json) {
    return DiscussionLists(
        pdfId: json['pdfId'] ?? '',
        pdfName: json['pdfName'] ?? '',
        pdfFollowerCount: int.parse(
          json['pdfFollowerCount'].toString(),
        ),
        pdfImportance: json['pdfImportance'] ?? '',
        discussionId: json['discussionId'] ?? '',
        title: json['title'] ?? '',
        metadata: json['metadata'] ?? '',
        body: json['body'] ?? '',
        likeCount: json['likeCount'] ?? '',
        commentCount: json['commentCount'] ?? '',
        createdOn: json['createdOn'] ?? '',
        img: List<String>.from( json['img']),
        source: json['source'] ?? '',
        ownerId: json['ownerId'] ?? '',
        ownerImg: json['ownerImg'] ?? '',
        ownerName: json['ownerName'] ?? '',
        ownerLevel: json['ownerLevel'] ?? '',
        ownerLevelName: json['ownerLevelName'] ?? '',
        commentedBy: json['commentedBy'] ?? '',
        likedBy:
            json['likedBy'] == null ? null : LikedBy.fromJson(json['likedBy']),
        ownerCategory: json['ownerCategory'] == null
            ? null
            : OwnerCategory.fromJson(json['ownerCategory']));
  }

  Map<String, dynamic> toJson() {
    return {
      'pdfId': pdfId,
      'pdfName': pdfName,
      'pdfFollowerCount': pdfFollowerCount,
      'pdfImportance': pdfImportance,
      'discussionId': discussionId,
      'title': title,
      'metadata': metadata,
      'body': body,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'createdOn': createdOn,
      'img': img,
      'source': source,
      'ownerId': ownerId,
      'ownerImg': ownerImg,
      'ownerName': ownerName,
      'ownerLevel': ownerLevel,
      'ownerLevelName': ownerLevelName,
      'commentedBy': commentedBy,
      'ownerCategory': ownerCategory?.toJson() ,
      'likedBy': likedBy?.toJson(),
    };
  }
}

class LikedBy {
  String? id;
  String? name;
  String? image;
  LikedBy({required this.id, required this.image, required this.name});

  factory LikedBy.fromJson(Map<String, dynamic> json) {
    return LikedBy(id: json['id'], image: json['image'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }
}

class OwnerCategory {
  String? icon;
  String? name;
  String? textColor;
  String? bgColor;
  OwnerCategory(
      {required this.icon,
      required this.name,
      required this.textColor,
      required this.bgColor});

  factory OwnerCategory.fromJson(Map<String, dynamic> json) {
    return OwnerCategory(
        icon: json['icon'],
        name: json['name'],
        textColor: json['textColor'],
        bgColor: json['bgColor']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'textColor': textColor,
      'bgColor': bgColor,
    };
  }
}
