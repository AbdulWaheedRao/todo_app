import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Components/Constant/colors_file.dart';
import 'package:note_pad2/Components/Constant/textstyle.dart';
import 'package:note_pad2/Routes/routes_method.dart';
import 'package:note_pad2/Screens/Login_Screen/login_screen_widget.dart';
import 'package:form_validator/form_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> key = GlobalKey<FormState>();
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void initState() {
    // Todo: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

 @override
  void dispose() {
    // Todo: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: allScreenColors,
      body: ListView(children: [
        SizedBox(
          height: height * 0.15,
        ),
        Center(
          child: SizedBox(
            height: height * 0.7,
            width: width * 0.9,
            // color: Colors.red,
            child: Form(
              key: key,
              child: Column(
                children: [
                  // ** Login Text .
                  loginText("Login Page",
                      TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: floatingPointButtonColors)),
                     
                  SizedBox(height: height * 0.060,),
                  // ** Login TextFormField
                   LoginTextField(
                    controller: emailController,
                    hintText: "Email",
                    hintStyle:const TextStyle(color: Colors.white),
                    prefixIcon:const Icon(Icons.mark_email_read_sharp,color: Colors.white,),
                    validator: ValidationBuilder(requiredMessage: "Enter Email").email("Enter Your Correct Email").build()
                    
                  ),
                  SizedBox(
                    height: height * 0.060,
                  ),
                   LoginTextField(
                    controller: passwordController,
                    hintText: "Password",
                    hintStyle:const TextStyle(color: Colors.white),
                    prefixIcon:const Icon(Icons.password_rounded,color: Colors.white,),
                    validator: ValidationBuilder(requiredMessage: "Enter Password").maxLength(6).build()
                  ),
                  
                  SizedBox(height: height * 0.1),

                  CupertinoButton( 
                    onPressed: () async{
                     pageValidationLoaded();
                      SharedPreferences  preferences = await SharedPreferences.getInstance();
                      preferences.setString("email", emailController.text.toString());
                      preferences.setString("password", passwordController.text.toString());
                      preferences.setBool("login", true);

                     
                      
                    },
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    child:  Text("Login Page",style: textStyle(20, FontWeight.w600, FontStyle.italic, Colors.white),),)
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  void pageValidationLoaded(){
    if (key.currentState!.validate()) {
      Navigator.pushNamed(context, RoutesName.firstScreen);
    }
  }
}