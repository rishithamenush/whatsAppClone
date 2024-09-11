import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? username;
  final String? email;
  final String? phoneNumber;
  final bool? isOnline;
  final String? uid;
  final String? status;
  final String? profileUrl;

  const UserModel({
    this.username,
    this.email,
    this.phoneNumber,
    this.isOnline,
    this.uid,
    this.status,
    this.profileUrl
  }) : super(
      username: username,
      email: email,
      uid: uid,
      profileUrl: profileUrl,
    phoneNumber: phoneNumber,
    isOnline: isOnline,
    status: status
  );
}