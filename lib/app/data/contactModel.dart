class ContactModel {
  int? id;
  String? phone1;
  String? phone2;
  String? email;
  String? address;
  String? facebook;
  String? messenger;
  String? viber;
  String? telegram;
  String? tiktok;
  DateTime? createdAt;
  DateTime? updatedAt;

  ContactModel({
    this.id,
    this.phone1,
    this.phone2,
    this.email,
    this.address,
    this.facebook,
    this.messenger,
    this.viber,
    this.telegram,
    this.tiktok,
    this.createdAt,
    this.updatedAt,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      id: json['id'] as int?,
      phone1: json['phone_1'] as String?,
      phone2: json['phone_2'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      facebook: json['facebook'] as String?,
      messenger: json['messenger'] as String?,
      viber: json['viber'] as String?,
      telegram: json['telegram'] as String?,
      tiktok: json['tiktok'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_1': phone1,
      'phone_2': phone2,
      'email': email,
      'address': address,
      'facebook': facebook,
      'messenger': messenger,
      'viber': viber,
      'telegram': telegram,
      'tiktok': tiktok,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
