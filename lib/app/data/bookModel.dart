class BookModel {
  int? id;
  String? title;
  String? authorName;
  String? email;
  String? bio;
  bool? publish;
  String? cover;
  List<Room>? rooms;

  BookModel({
    this.id,
    this.title,
    this.authorName,
    this.email,
    this.bio,
    this.publish,
    this.cover,
    this.rooms,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      authorName: json['author_name'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      publish: json['publish'] as bool?,
      cover: json['cover'] as String?,
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((room) => Room.fromJson(room as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author_name': authorName,
      'email': email,
      'bio': bio,
      'publish': publish,
      'cover': cover,
      'rooms': rooms?.map((room) => room.toJson()).toList(),
    };
  }
}

class Room {
  int? id;
  String? title;
  String? content;

  Room({
    this.id,
    this.title,
    this.content,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
