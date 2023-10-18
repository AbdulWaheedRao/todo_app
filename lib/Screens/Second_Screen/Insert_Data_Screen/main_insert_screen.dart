import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../../Components/Constant/colors_file.dart';
import '../../../Components/Constant/textstyle.dart';
import '../../../Components/Driectories/Note_Pad_DBHelper_Classes/main_note_pad_db_provider_database.dart';
import '../../../Models/note_pad_model_class.dart';
import 'insert_screen_widget.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {
  NotePadProvider notePadProvider = NotePadProvider();
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  
 
  void insertingData() async {
    try {
      notePadProvider.insertNotePad(
        modelClass: NotePadModelClass(
            title: titleController.text,
            description: descriptionController.text));
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Text("Successfully Insert Data .",
      style: textStyle(18, FontWeight.w500, FontStyle.italic, Colors.white),),
      behavior: SnackBarBehavior.floating,
      backgroundColor: floatingPointButtonColors,
      dismissDirection: DismissDirection.horizontal,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),

    ));
    } catch (e) {
      print("Do'nt Insert This Data ::  ${e.toString()}");
    }
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
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
        title: AutoSizeText("INSERT",
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
          insertingData();
        },
        backgroundColor: floatingPointButtonColors,
        shape:const CircleBorder(),
        child:const Icon(Icons.save,color: Colors.white),),
    );
  }
}
