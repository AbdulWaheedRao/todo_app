import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_pad2/Screens/Login_Screen/main_login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/Constant/colors_file.dart';
import '../First_Screen/View_Data_Screen/main_view_screen.dart';

/// Todo: As Splash Screen ka jo error a raha tha wo solve krna ha
/// Todo: means ky console pr jb splash screen load hote ha to mounted ka error
/// Todo: ata ha asy solve krna ha .
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {
  late Timer _timer;
  @override
  void initState()  {
    super.initState();
    loadingScreen();
  }

 void loadingScreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool load = preferences.getBool("login") ?? false;

    if (load) {
      _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const FetchingScreen(),
            ));
      });
    } else {
      _timer = Timer.periodic(const Duration(seconds: 6), (timer) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  ///* These are Code making error . Seen this error going To Time .
  //   @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 6), (timer) {
  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FetchingScreen(),));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allScreenColors,
      body: Center(
          child: Lottie.asset("lottie_animation/note2.json",
              height: 200, reverse: true, fit: BoxFit.cover, repeat: true)),
    );
  }
}
