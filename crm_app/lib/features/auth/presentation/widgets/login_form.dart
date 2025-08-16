import 'package:crm_app/core/constants/appButtonStyles.dart';
import 'package:crm_app/core/constants/appColors.dart';
import 'package:crm_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading =false;

 
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Text("WELCOME BACK !" , style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold),),
        
              SizedBox(height: 10,),
          
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "";
                  }
                  return null ;
                },
                onSaved: (email){} ,
                cursorColor: Appcolors.milkyGreen,
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
          
              SizedBox(height: 20,),
          
              TextFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "";
                  }
                  return null ;
                },
                onSaved: (password){},
                obscureText: true,
                cursorColor: Appcolors.milkyGreen,
                decoration: InputDecoration(
                  hintText: "Password"
                ),
              ),
          
              SizedBox(height: 80,),
          
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    isShowLoading = true;
                  });
                  
                }, 
                style: AppButtonStyles.topButton,
                child: Text("LOGIN"),),
          
                SizedBox(height: 20,),
                Text("---------  OR  ---------" ,),
                SizedBox(height: 20,),
          
                ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, AppRoutes.signUp);
                }, 
                style:AppButtonStyles.bottomButton,
                child: Text("Don't have an account ?"),
                ),
          
            ],
          )
        ),
      ]
    );
  }
}

