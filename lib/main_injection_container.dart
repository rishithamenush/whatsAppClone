
import 'package:get_it/get_it.dart';

import 'features/user/user_injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async{
  await userInjectionContainer();
}