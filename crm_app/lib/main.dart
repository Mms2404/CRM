import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:crm_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyCrm());
}

class MyCrm extends StatelessWidget {
  const MyCrm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CRM App",
      theme: ThemeData(
        fontFamily: 'Rockwell',
        primaryColor: Appcolors.milkyGreen,
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}