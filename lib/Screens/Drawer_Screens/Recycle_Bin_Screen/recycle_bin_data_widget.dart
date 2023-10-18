// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:note_pad2/Components/Driectories/Recycle_Bin_Note_Pad_DBHelper_Class/main_recycle_bin_db_provider_database.dart';
import 'package:note_pad2/Models/note_pad_model_class.dart';

import '../../../Components/Constant/textstyle.dart';

class RecycleBin extends StatefulWidget {
  const RecycleBin({super.key});

  @override
  State<RecycleBin> createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  final RecycleBinProvider _helper = RecycleBinProvider();
  List<NotePadModelClass> _empty_RecycleBin_List = [];

  recycleBinData() async {
    _empty_RecycleBin_List = await _helper.getRecycleBinData();
    setState(() {});
  }

  Future<void> _refresh() {
    recycleBinData();
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    recycleBinData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      color: Colors.green,
      displacement: 50,
      strokeWidth: 3,
      backgroundColor: Colors.pink,
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: _empty_RecycleBin_List.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            color: Colors.primaries[index % 5],
            child: ListTile(
              leading: AutoSizeText(_empty_RecycleBin_List[index].id.toString(),
                  style: textStyle(
                      22, FontWeight.w200, FontStyle.italic, Colors.white)),
              title: AutoSizeText(
                _empty_RecycleBin_List[index].title.toString(),
                style: textStyle(
                    22, FontWeight.bold, FontStyle.italic, Colors.white),
              ),
              subtitle: AutoSizeText(
                  _empty_RecycleBin_List[index].description.toString(),
                  style: textStyle(15, FontWeight.w500, FontStyle.normal,
                      const Color.fromARGB(255, 236, 236, 236)),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
              trailing: InkWell(
                  splashColor: Colors.green,
                  onTap: () async {
                    bool delete = await _helper.deleteRecycleBinData(
                        id: _empty_RecycleBin_List[index].id);
                    if (delete) {
                      setState(() {
                        recycleBinData();
                      });
                    }
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.amber,
                  )),
            ),
          );
        },
      ),
    );
  }
}
