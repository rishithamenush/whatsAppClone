import 'package:whatsapp_clone/features/user/domain/repository/user_repository.dart';

class SignInWithPhoneNumber{
  final UserRepository repository;

  SignInWithPhoneNumber({required this.repository});

  Future<void> call(String smsPinCode) async{
    return repository.signInWithPhoneNumber(smsPinCode);
  }
}