import 'dart:ffi';

import 'package:whatsapp_clone/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/get_device_number/get_device_number_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/user/user_cubit.dart';

import '../../main_injection_container.dart';

Future<void> userInjectionContainer() async {

  // * CUBIT INJECTION

  sl.registerFactory<AuthCubit> (() => AuthCubit(
      getCurrentUidUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call()
  ));

  sl.registerFactory<UserCubit>(() => UserCubit(
      updateUserUseCase: sl.call(),
      getAllUsersUseCase: sl.call(),
  ));

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      signInWithPhoneNumberUseCase: sl.call(),
      verifyPhoneNumberUseCase: sl.call(),
      createUserUseCase: sl.call(),
  ));

  sl.registerFactory<GetDeviceNumberCubit>(() => GetDeviceNumberCubit(
      getDeviceNumberUsecase: sl.call(),
  ));


  //* USE CASES INJECTION

  // * REPOSITORY & DATA SOURCES INJECTION

}