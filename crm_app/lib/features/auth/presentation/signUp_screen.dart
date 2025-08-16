import 'package:crm_app/core/widgets/appTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTextField(
            controller: emailController, 
            labelText: "Email"
          ),
          SizedBox(height: 10,),
          AppTextField(
            controller: passwordController, 
            labelText: "Password")
        ],
      ),
    );
  }
}