import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class Customers extends StatelessWidget {
  Customers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.milkyGreen,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.signIn);
          }, 
          icon: Icon(Icons.arrow_back_ios_new_sharp)),
          title: Text("CUSTOMERS"),
      ),
      body: Center(
        child: Text(""),
      ),
    );
  }
}