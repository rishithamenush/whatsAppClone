import 'package:whatsapp_clone/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:whatsapp_clone/features/user/domain/entities/contact_entity.dart';
import 'package:whatsapp_clone/features/user/domain/entities/user_entity.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository.dart';

class UserReositoryImpl implements UserRepository{
  final UserRemoteDataSource remoteDataSource;

  UserReositoryImpl({required this.remoteDataSource});

  @override
  Future<void> createUser(UserEntity user) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getAllUsers() {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUID() {
    // TODO: implement getCurrentUID
    throw UnimplementedError();
  }

  @override
  Future<List<ContactEntity>> getDeviceNumber() {
    // TODO: implement getDeviceNumber
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getSingleUser(String uid) {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    // TODO: implement isSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithPhoneNumber(String smsPinCode) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> updateUser(UserEntity user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhoneNumber(String phoneNumber) {
    // TODO: implement verifyPhoneNumber
    throw UnimplementedError();
  }
  
}