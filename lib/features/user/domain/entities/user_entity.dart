import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String? username;
  final String? email;
  final String? phoneNumber;
  final bool? isOnline;
  final String? uid;
  final String? status;
  final String? profileUrl;
  @override
  List<Object?> get props => [];
}