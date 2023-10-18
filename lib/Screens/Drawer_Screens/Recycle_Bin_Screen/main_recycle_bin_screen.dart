import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Models/note_pad_model_class.dart';
import 'package:note_pad2/Screens/Drawer_Screens/Recycle_Bin_Screen/recycle_bin_data_widget.dart';
import 'package:note_pad2/Routes/routes_method.dart';
import '../../../Components/Constant/colors_file.dart';
import '../../../Components/Constant/textstyle.dart';

class RecycleBinScreen extends StatefulWidget {
  const RecycleBinScreen({super.key});

  @override
  State<RecycleBinScreen> createState() => _RecycleBinScreenState();
}

class _RecycleBinScreenState extends State<RecycleBinScreen> {
  List<NotePadModelClass> recycleBinEmpty = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allScreenColors,
      appBar: AppBar(
        backgroundColor: allScreenColors,
        centerTitle: true,
        title: AutoSizeText(
          "RECYCLE BIN",
          style:
              textStyle(30, FontWeight.bold, FontStyle.italic, Colors.white),
        ),
        leading: InkWell(
            onTap: () => Navigator.pushNamed(context, RoutesName.firstScreen),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),
      body: recycleBinEmpty.isEmpty ? const RecycleBin() : const RecycleBin(),
    );
  }


}
