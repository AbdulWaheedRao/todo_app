class NotePadModelClass {
  int? id;
  String? title;
  String? description;

  // ** Constructor working update this insert data OR update data
  NotePadModelClass({this.id, this.title, this.description});

// ** (Products.fromMap ) Using for fetch data
  NotePadModelClass.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    description = map["description"];
  }


// ** (toMap) Using for insert data.
  Map<String, dynamic> toMap() {
    return {"id": id, "title": title, "description": description};
  }
}
