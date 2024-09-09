import 'dart:ffi';
import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';

class ContactEntity{
  final String? phoneNumber;
  final String? label;
  final String? uid;
  final String? status;
  final Uint8List? userProfile;

  ContactEntity(this.phoneNumber, this.label, this.uid, this.status, this.userProfile);
}