// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:note_pad2/Components/Constant/colors_file.dart';
import 'package:note_pad2/Routes/routes_method.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constant/textstyle.dart';

class BeautifulDrawer extends StatefulWidget {
  const BeautifulDrawer({super.key});

  @override
  State<BeautifulDrawer> createState() => _BeautifulDrawerState();
}

class _BeautifulDrawerState extends State<BeautifulDrawer> {
  String email = "";
  String password = "";

  ggg() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    email = preferences.getString("email")!;
    password = preferences.getString("password")!;
  }

  @override
  Widget build(BuildContext context) {
    var heightMediaQuery = MediaQuery.sizeOf(context).height;
    var widthMediaQuery = MediaQuery.sizeOf(context).width;
    return Drawer(
      elevation: 5,
      shadowColor: const Color.fromARGB(181, 223, 223, 223),
      backgroundColor: allScreenColors,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50), topRight: Radius.circular(50))),
      child: ListView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          //  (DrawerHeader)
          DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Expanded(
                      child: Center(
                          child: Text(
                    "NotePad",
                    style: textStyle(
                      35,
                      FontWeight.bold,
                      FontStyle.italic,
                      Colors.white,
                    ),
                  ))),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                        height: heightMediaQuery * 0.1,
                        width: widthMediaQuery,
                        child: const Image(
                            image: AssetImage("assest/images/notepad.png"))),
                  ),
                ],
              )),
          //  List of Drawer Working .
          listTile(
            onTap: () =>
                Navigator.pushNamed(context, RoutesName.recycleBinScreen),
            text: "RecycleBin",
            icon: Icons.recycling_rounded,
          ),
          listTile(
              onTap: () => Navigator.pushNamed(context, RoutesName.aboutScreen),
              text: "About",
              icon: Icons.info_outline_rounded),

          listTile(
              onTap: () async {
                ggg();
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                bool load = preferences.getBool("login") ?? false;
                if (load) {
                  preferences.clear();
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                }
              },
              text: "Logout",
              icon: Icons.login_outlined),
        ],
      ),
    );
  }

  Widget listTile({String? text, IconData? icon, GestureTapCallback? onTap}) {
    return Card(
      color: allScreenColors,
      elevation: 5,
      shadowColor: const Color.fromARGB(255, 206, 206, 206).withOpacity(0.2),
      margin: const EdgeInsets.all(10),
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            text.toString(),
            style:
                textStyle(20, FontWeight.w500, FontStyle.normal, Colors.white),
          ),
          leading: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
