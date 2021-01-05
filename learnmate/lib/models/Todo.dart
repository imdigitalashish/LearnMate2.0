class Todo {
  int id;
  String item;

  Todo({this.id, this.item});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['item'] = this.item;
    return data;
  }
}