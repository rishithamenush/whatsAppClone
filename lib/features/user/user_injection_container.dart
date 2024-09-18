import 'dart:ffi';

import 'package:whatsapp_clone/features/user/presentation/cubit/auth/auth_cubit.dart';

import '../../main_injection_container.dart';

Future<void> userInjectionContainer() async {

  // * CUBIT INJECTION

  sl.registerFactory<AuthCubit> (() => AuthCubit(
      getCurrentUidUseCase: sl.call(),
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call()));


  //* USE CASES INJECTION

  // * REPOSITORY & DATA SOURCES INJECTION

}