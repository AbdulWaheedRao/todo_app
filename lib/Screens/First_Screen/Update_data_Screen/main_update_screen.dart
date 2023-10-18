// ignore_for_file: use_build_context_synchronously

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Screens/First_Screen/Update_data_Screen/update_data_widget.dart';
import '../../../Components/Constant/colors_file.dart';
import '../../../Components/Constant/textstyle.dart';
import '../../../Components/Driectories/Note_Pad_DBHelper_Classes/main_note_pad_db_provider_database.dart';
import '../../../Models/note_pad_model_class.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key, required this.modelClass});
  final NotePadModelClass modelClass;
  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  NotePadProvider helper = NotePadProvider();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController idController = TextEditingController();


///* using this function all this data receive to (fetchingScreen) and receive 
///* show data (updateData) Screen 
  updatingData() async {
    try {
      NotePadModelClass note = NotePadModelClass(
            id: int.parse(idController.text),
            title: titleController.text,
            description: descriptionController.text);
     await helper.updateNotePad( modelClass:note );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: AutoSizeText("Successfully Update Data .",
      style: textStyle(18, FontWeight.w500, FontStyle.italic, Colors.white),),
      behavior: SnackBarBehavior.floating,
      backgroundColor: floatingPointButtonColors,
      dismissDirection: DismissDirection.horizontal,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))));
    } catch (e) {
      print("Hy jawad Throw Exception in this Database :: ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    idController =  TextEditingController();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    idController.text = widget.modelClass.id.toString();
    titleController.text = widget.modelClass.title.toString();
    descriptionController.text = widget.modelClass.description.toString();
  }

  @override
  void dispose() {
    idController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allScreenColors,
      appBar: AppBar(
        backgroundColor: allScreenColors,
        centerTitle: true,
        title: AutoSizeText("UPDATE",
        style: textStyle(30, FontWeight.bold, FontStyle.italic, Colors.white),),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back,color: Colors.white,)),
      ),
      body: ListView(
        padding:const EdgeInsets.all(8.0),
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          const SizedBox(
            height: 20,
          ),
          textFieldMethod(
            controller: titleController,
            validator: null,
            hintText: "Title",
            textStyle: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.white)
          ),
          const SizedBox(height: 20,),
          textFieldMethod(
            controller: descriptionController,
            validator: null,
            hintText: "Note something down",
            keyboardType: TextInputType.multiline,
            textStyle: const TextStyle(fontSize: 18,color: Colors.white)
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
            updatingData();
        },
        backgroundColor: floatingPointButtonColors,
        shape:const CircleBorder(),
        child:const Icon(Icons.update,color: Colors.white),),
    );
  }

}
