import 'package:flutter/material.dart';
import 'package:note_pad2/Screens/Drawer_Screens/About_Screen/main_about_screen.dart';
import 'package:note_pad2/Screens/Drawer_Screens/Recycle_Bin_Screen/main_recycle_bin_screen.dart';
import 'package:note_pad2/Screens/Login_Screen/main_login_screen.dart';

import '../Models/note_pad_model_class.dart';
import '../Screens/First_Screen/Update_data_Screen/main_update_screen.dart';
import '../Screens/First_Screen/View_Data_Screen/main_view_screen.dart';
import '../Screens/Second_Screen/Insert_Data_Screen/main_insert_screen.dart';
import '../Screens/Splash_Screen/main_splash_screen.dart';

class RoutesName {
  static const String splashScreen = "splashScreen";
  static const String firstScreen = "fetchScreen";
  static const String secondScreen = "insertScreen";
  static const String thirdScreen = "updateScreen";
  static const String recycleBinScreen = "recycleBinScreen";
  static const String aboutScreen = "aboutScreen";
  static const String loginScreen = "loginScreen";
}

class RoutesMethod {
  static Route<dynamic>? onGenerate(RouteSettings settings) {
    if (settings.name == RoutesName.splashScreen) {
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    } else if (settings.name == RoutesName.firstScreen) {
      return MaterialPageRoute(
        builder: (context) => const FetchingScreen(),
      );
    } else if (settings.name == RoutesName.secondScreen) {
      return MaterialPageRoute(
        builder: (context) => const InsertScreen(),
      );
    } else if (settings.name == RoutesName.thirdScreen) {
      return MaterialPageRoute(
        builder: (context) =>
            UpdateData(modelClass: settings.arguments as NotePadModelClass),
      );
    } else if (settings.name == RoutesName.recycleBinScreen) {
      return MaterialPageRoute(
        builder: (context) => const RecycleBinScreen(),
      );
    } else if (settings.name == RoutesName.aboutScreen) {
      return MaterialPageRoute(
        builder: (context) => const AboutScreen(),
      );
    } else if (settings.name == RoutesName.loginScreen) {
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) {
          return const Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(
                "Do'nt Found This Pages. ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      );
    }
  }
}
