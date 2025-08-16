import 'package:crm_app/core/constants/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewonlyScreen extends StatelessWidget {
  const ViewonlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.day,
      body: Center(
      child : Text("View Only Screen"))
    );
  }
}