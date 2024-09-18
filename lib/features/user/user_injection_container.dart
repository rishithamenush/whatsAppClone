import 'dart:ffi';

import 'package:whatsapp_clone/features/user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:whatsapp_clone/features/user/data/data_sources/remote/user_remote_data_source_impl.dart';
import 'package:whatsapp_clone/features/user/domain/repository/user_repository.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/credential/get_current_uid_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/credential/is_sign_in_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/credential/sign_in_with_phone_number.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/credential/sign_out_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/credential/verify_phone_number_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/user/create_user_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/user/get_all_users_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/user/get_single_user_usecase.dart';
import 'package:whatsapp_clone/features/user/domain/usecases/user/update_user_usecase.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/get_device_number/get_device_number_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/cubit/user/user_cubit.dart';

import '../../main_injection_container.dart';
import 'data/repository/repository_impl.dart';

Future<void> userInjectionContainer() async {
  // * CUBIT INJECTION

  sl.registerFactory<AuthCubit>(() =>
      AuthCubit(
          getCurrentUidUseCase: sl.call(),
          isSignInUseCase: sl.call(),
          signOutUseCase: sl.call()
      ));

  sl.registerFactory<UserCubit>(() =>
      UserCubit(
        updateUserUseCase: sl.call(),
        getAllUsersUseCase: sl.call(),
      ));

  sl.registerFactory<CredentialCubit>(() =>
      CredentialCubit(
        signInWithPhoneNumberUseCase: sl.call(),
        verifyPhoneNumberUseCase: sl.call(),
        createUserUseCase: sl.call(),
      ));

  sl.registerFactory<GetDeviceNumberCubit>(() =>
      GetDeviceNumberCubit(
        getDeviceNumberUsecase: sl.call(),
      ));


  //* USE CASES INJECTION

  sl.registerLazySingleton <GetCurrentUidUseCase>(() =>
      GetCurrentUidUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
          () => IsSignInUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignOutUseCase>(
          () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<CreateUserUseCase>(
          () => CreateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetAllUsersUseCase>(
          () => GetAllUsersUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateUserUseCase>(
          () => UpdateUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetSingleUserUseCase>(
          () => GetSingleUserUseCase(repository: sl.call()));

  sl.registerLazySingleton<SignInWithPhoneNumberUseCase>(
          () => SignInWithPhoneNumberUseCase(repository: sl.call()));

  sl.registerLazySingleton<VerifyPhoneNumberUsecase>(
          () => VerifyPhoneNumberUsecase(repository: sl.call()));


  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(remoteDataSource: sl.call())
  );

  sl.registerLazySingleton<UserRemoteDataSource>( () => UserRemoteDataSourceImpl(
      fireStore: sl.call(),
      auth: sl.call())
  );

}