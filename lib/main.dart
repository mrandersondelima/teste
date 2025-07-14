import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hora_do_foco/controllers/login_screen_controller.dart';
import 'package:hora_do_foco/controllers/new_task_controller.dart';
import 'package:hora_do_foco/controllers/page_view_controller.dart';
import 'package:hora_do_foco/controllers/user_controller.dart';
import 'package:hora_do_foco/screens/home_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const keyApplicationId = 'ZZOjnMXBHkEF8fcErlZEglg4zTU06Hl01IlXQumH';
  const keyClientKey = 'dMKIvtslKTd9vV7Bk2MNEhG2pImwDZjvAExfss23';
  const keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  Get.put<LoginScreenController>(LoginScreenController(), permanent: true);
  Get.put<UserController>(UserController(), permanent: true);
  Get.put<PageViewController>(PageViewController(), permanent: true);
  Get.put<NewTaskController>(NewTaskController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      locale: const Locale('pt', 'BR'),
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('pt', 'BR')],
      title: 'Hora do Foco',
      themeMode: ThemeMode.system,
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
          primaryColor: Colors.red,
          hintColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(title: 'Hora do Foco'),
    );
  }
}
