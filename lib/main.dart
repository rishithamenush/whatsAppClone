import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/features/app/home/home_page.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';
import 'package:whatsapp_clone/routes/on_generate_routes.dart';
import 'features/user/presentation/cubit/auth/auth_cubit.dart';
import 'features/user/presentation/cubit/credential/credential_cubit.dart';
import 'features/user/presentation/cubit/get_device_number/get_device_number_cubit.dart';
import 'features/user/presentation/cubit/get_single_user/get_single_user_cubit.dart';
import 'features/user/presentation/cubit/user/user_cubit.dart';
import 'firebase_options.dart';
import 'main_injection_container.dart' as di;
import 'features/app/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (context) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetSingleUserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetDeviceNumberCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(
              color: appBarColor
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoutes.route,
        routes: {
          "/": (context){
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState){
                if(authState is Authenticated){
                  return HomePage(uid: authState.uid);
                }
                return SplashScreen();
              }
            );        }
        },
      ),
    );
  }
}
