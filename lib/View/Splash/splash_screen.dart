import 'package:flutter/material.dart';
import 'package:second_project/view/utils/colours/colours.dart';
import '../Login%20and%20SignUp/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey300,
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/CartZone.png'),
            ),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }

  Future<void> goToHome() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<StatelessWidget>(
        builder: (BuildContext context) => const LogInScreen(),
      ),
    );
  }
}
