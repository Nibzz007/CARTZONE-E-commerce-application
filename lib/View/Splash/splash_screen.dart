import 'package:flutter/material.dart';
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
      //backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/images/ef824ee86efb3ec6cc6eb6758cd5e70c.jpg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  Future <void> goToHome() async {
    await Future <dynamic> .delayed(const Duration(seconds: 3));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute <StatelessWidget> (
        builder: (BuildContext context) => const LogInScreen(),
      ),
    );
  }
}
