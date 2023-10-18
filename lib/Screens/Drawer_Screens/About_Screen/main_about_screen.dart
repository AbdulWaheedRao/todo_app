import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Components/Constant/colors_file.dart';

import '../../../Components/Constant/textstyle.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: allScreenColors,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  AutoSizeText("Muhammad Jawad",style: textStyle(25, FontWeight.bold, FontStyle.italic,const Color.fromARGB(255, 139, 187, 66)),),
                 SizedBox(
                  height: 100,
                  width: 250,
                   child: AutoSizeText("This is beautiful Interface and complete CRUD operation. Here feature Delete Data show this RecycleBin",
                   style: textStyle(15, FontWeight.w200, FontStyle.normal,const Color.fromARGB(194, 172, 222, 99)),textAlign: TextAlign.center),
                 ),
                ],
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(image: AssetImage("assest/images/notepad_about_page.png"))),
                  AutoSizeText("NotePad",style: textStyle(15, FontWeight.w400, FontStyle.italic, const Color.fromARGB(255, 139, 187, 66)),)
              ],)
            ],
          ),
        ),
      ),
    );
  }
}