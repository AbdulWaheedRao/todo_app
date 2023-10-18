// ignore_for_file: use_build_context_synchronously


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Screens/First_Screen/View_Data_Screen/view_data_widget.dart';
import '../../../Components/Constant/colors_file.dart';
import '../../../Components/Constant/textstyle.dart';
import '../../../Components/drawer.dart';
import '../../../Models/note_pad_model_class.dart';
import '../../../Routes/routes_method.dart';


class FetchingScreen extends StatefulWidget {
  const FetchingScreen({super.key});

  @override
  State<FetchingScreen> createState() => _FetchingScreenState();
}

class _FetchingScreenState extends State<FetchingScreen> {
  List<NotePadModelClass> emptyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allScreenColors,
      drawer: const BeautifulDrawer(),
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.white),
        backgroundColor: allScreenColors,
        centerTitle: true,
        title: AutoSizeText("NOTES",
        style: textStyle(30, FontWeight.bold, FontStyle.italic, Colors.white),),),
      body: emptyList.isEmpty?
      const BeautifulGridView()
      :const BeautifulGridView(),
      floatingActionButton: FloatingActionButton(
        elevation: 16,
        splashColor: Colors.red,
        backgroundColor: floatingPointButtonColors,
        onPressed: () =>Navigator.pushNamed(context, RoutesName.secondScreen),
        shape: const CircleBorder(),
        child: const Icon(Icons.add,color: Colors.white,size: 30,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }



}




// emptyList.isEmpty
//           ? const ListViewBuilder()
//           : const ListViewBuilder(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.pushNamed(context, RoutesName.secondScreen);
//         },
//         child: const Icon(Icons.next_plan_sharp),
//       ),