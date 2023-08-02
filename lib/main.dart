import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homelyn/config/light_theme.dart';
import 'package:homelyn/providers/confirm_password_provider.dart';
import 'package:provider/provider.dart';
import 'config/dark_theme.dart';
import 'providers/password_provider.dart';
import 'utils/routes.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Khởi tạo firebase trước khi runapp
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PasswordProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ConfirmPasswordProvider(),
          ),
        ],
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: RouteGenerator.splashPage,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      ),
    );
  }
}
