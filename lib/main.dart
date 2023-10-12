import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'controller/google_sign_in.dart';
import 'view/splash/splash_screen.dart';

Future<dynamic> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(
      create: (BuildContext context) {
        return GoogleSignInProvider();
      },
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(360, 690),
        builder: (_, child) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.deepPurple,
              ),
            ),
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
