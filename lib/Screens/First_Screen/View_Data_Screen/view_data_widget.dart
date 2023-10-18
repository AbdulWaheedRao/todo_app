// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../Components/Constant/textstyle.dart';
import '../../../Components/Driectories/Note_Pad_DBHelper_Classes/main_note_pad_db_provider_database.dart';
import '../../../Models/note_pad_model_class.dart';
import '../../../Routes/routes_method.dart';

// class ListViewBuilder extends StatefulWidget {
//   const ListViewBuilder({super.key});

//   @override
//   State<ListViewBuilder> createState() => _ListViewBuilderState();
// }

// class _ListViewBuilderState extends State<ListViewBuilder> {
//   NotePadProvider helper = NotePadProvider();
//   List<NotePadModelClass> emptyList = [];

//   viewData() async {
//     emptyList = await helper.getNotePad();
//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     viewData();
//     setState(() {});
//   }

//   Future<void> _refresh() {
//     viewData();
//     return Future.delayed(const Duration(seconds: 4));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refresh,
//       color: Colors.lime,
//       displacement: 50,
//       strokeWidth: 2,
//       backgroundColor: Colors.teal,
//       child: ListView.builder(
//         itemCount: emptyList.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Text(emptyList[index].id.toString()),
//             title: Text(
//               emptyList[index].title.toString(),
//             ),
//             subtitle: Text(emptyList[index].description.toString()),
//             trailing: GestureDetector(
//                 onTap: () async {
//                   bool delete =
//                       await helper.deleteNotePad(id: emptyList[index].id);
//                   if (delete) {
//                     setState(() {
//                       viewData();
//                     });
//                   } else {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Do'nt Delete Data .")));
//                   }
//                 },
//                 child: Icon(
//                   Icons.delete,
//                   color: Colors.primaries[index % 10],
//                 )),
//           );
//         },
//       ),
//     );
//   }
// }







class BeautifulGridView extends StatefulWidget {
  const BeautifulGridView({super.key});

  @override
  State<BeautifulGridView> createState() => _BeautifulGridViewState();
}

class _BeautifulGridViewState extends State<BeautifulGridView> {
  NotePadProvider helper = NotePadProvider();

///* Using Empty list as laya ki q ka jo data hmra insert ho raha ha asy hm ny 
///* khi View to krwana ha aur jo data view ho raha ha wo (insert) ma sa ak list 
///* ki sorat ma a raha ha aur as list ko hm ny Fetch krwany ka laya ak list bnye
///* js ka name hm na (emptyList) rakha
  List<NotePadModelClass> emptyList = [];
  // ** Random class using this colors irrSequence 
  Random random = Random();

 
 ///* jo hm na (NotePadProvider) app ma (Fetch) krny ki query lakhe ha ays Query 
 ///* ko as method ma use kr raha ha (await) lga kr
  viewMainData() async {
    emptyList = await helper.getNotePad();
    setState(() {});
  }



  @override
  void initState() {
    super.initState();
    viewMainData();
    setState(() {});
  }
 
///* Using This (RefreshIndicator) and jo data as method ma a raha ha wo (Future) 
///* ma a raha ha aur ak (Delay) ka sth a raha ha . Aur ya method Future ma (void)
///* kuch bhi return nhi kr raha .
  Future<void> _refresh() {
    viewMainData();
    return Future.delayed(const Duration(seconds: 4));
  }

  @override
  Widget build(BuildContext context) {
    return emptyList.isEmpty? RefreshIndicator(
      onRefresh: _refresh,
      color: Colors.green,
      displacement: 50,
      strokeWidth: 3,
      backgroundColor: Colors.pink,
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: const[
            SizedBox(height: 60,),
            Center(child: Icon(Icons.keyboard_double_arrow_down_rounded,
            color: Colors.red,size: 40,))
            ]),
      ))
    :RefreshIndicator(
      onRefresh: _refresh,
      color: Colors.green,
      displacement: 50,
      strokeWidth: 3,
      backgroundColor: Colors.pink,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: MasonryGridView.builder(
          padding: const EdgeInsets.all(0),
          crossAxisSpacing:10,
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: emptyList.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context,int index) {
    
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.thirdScreen,
                arguments: NotePadModelClass(
                  id: emptyList[index].id,
                  title: emptyList[index].title,
                  description: emptyList[index].description
                ));
              },
    
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [BoxShadow(blurRadius: 1,spreadRadius: 0.5,color: Colors.white,blurStyle: BlurStyle.outer)],
                      color: Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                      AutoSizeText(emptyList[index].title.toString(),
                      style: textStyle(22, FontWeight.bold, FontStyle.italic,Colors.white),),
                      const SizedBox(height: 10,),
                      AutoSizeText(emptyList[index].description.toString(),
                      style: textStyle(15, FontWeight.w500, FontStyle.normal, const Color.fromARGB(255, 236, 236, 236)),),
                      const SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () async{
                            bool delete =await helper.deleteNotePad(id: emptyList[index].id);
                            if (delete) {
                              setState(() {
                                viewMainData();
                              });
                            }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Do'nt Delete Data .")));
                            }
                          },
                          child:const Icon(Icons.delete_forever_outlined,color: Colors.amber,)))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}