import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Routes/routes_method.dart';

void main() {
  runApp(const NotePadApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color.fromARGB(255, 71, 71, 71),
  ));
}

class NotePadApp extends StatelessWidget {
  const NotePadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NotePad App',
      theme: ThemeData(
        iconTheme:const IconThemeData(color: Colors.white),
        primaryIconTheme:const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: RoutesMethod.onGenerate,
    );
  }
}
