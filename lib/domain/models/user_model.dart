class UserModel {
  final String id;          // auth UUID as string
  final String email;
  final String name;
  final String? avatarUrl;
  final String provider;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.avatarUrl,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
  });

  // ---------- FROM JSON ----------
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uuid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatar_url'] as String?,
      provider: json['provider'] as String,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // ---------- TO JSON ----------
  Map<String, dynamic> toJson() {
    return {
      'uuid': id,
      'email': email,
      'name': name,
      'avatar_url': avatarUrl,
      'provider': provider,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // ---------- COPY WITH ----------
  UserModel copyWith({
    String? id,
    String? email,
    String? name,
    String? avatarUrl,
    String? provider,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      provider: provider ?? this.provider,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
