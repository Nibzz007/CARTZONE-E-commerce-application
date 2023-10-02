import 'package:flutter/material.dart';
import '../../utils/texts/privacy_policy.dart';
import '../../utils/texts/terms_and_conditions.dart';

class SettingsScreenWidget extends StatelessWidget {
  SettingsScreenWidget({super.key, required this.screenName});

  final String screenName;
  String? screenContent;

  @override
  Widget build(BuildContext context) {
    screenContent =
        screenName == 'Privacy Policy' ? privacyPolicy : termsAndConditions;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          screenName,
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
      ),
    );
  }
}
