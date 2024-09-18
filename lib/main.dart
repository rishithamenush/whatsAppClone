
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/app/theme/style.dart';
import 'package:whatsapp_clone/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;
import 'features/app/splash/splash_screen.dart';

void main() async{
  await di.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        "/": (context) => SplashScreen()
      },
    );
  }
}
