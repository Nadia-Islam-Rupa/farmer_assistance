import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final DateTime? createdAt;
  final String? photoUrl;
  final String? phoneNumber;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.createdAt,
    required this.photoUrl,
    required this.phoneNumber,
  });

  /// Convert UserModel → Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
    };
  }

  /// Create UserModel from Firestore Document
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      photoUrl: map['photoUrl'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  /// Create UserModel from Firestore DocuFirebaseAuth.instancementSnapshot
  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromMap(data);
  }

  @override
  String toString() {
    return "$uid, $name, $email, $createdAt, $photoUrl, $phoneNumber";
  }
}
