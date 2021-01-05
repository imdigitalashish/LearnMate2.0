class Book {
  int id;
  String phone;
  String name;
  String city;
  String pin;
  String book;

  Book({this.id, this.phone, this.name, this.city, this.pin, this.book});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    name = json['name'];
    city = json['city'];
    pin = json['pin'];
    book = json['book'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['name'] = this.name;
    data['city'] = this.city;
    data['pin'] = this.pin;
    data['book'] = this.book;
    return data;
  }
}