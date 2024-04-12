// class Book {
//   String? title;
//   String? price;
//   String? date;
//   String? time;
//   bool? status;

//   Book({this.title, this.price, this.date, this.time, this.status});
// }

class Book {
  String? id;
  String? title;
  String? date;
  String? image;
  String? license;
  String? location;
  String? make;
  String? model;
  String? name;
  String? phone;
  int? price;
  String? requiredTime;
  bool? status;
  String? time;
  String? yom;

  Book({
    this.id,
    this.title,
    this.date,
    this.image,
    this.license,
    this.location,
    this.make,
    this.model,
    this.name,
    this.phone,
    this.price,
    this.requiredTime,
    this.status,
    this.time,
    this.yom,
  });

  factory Book.fromJson(Map<dynamic, dynamic> json) {
    return Book(
      id: json["id"],
      title: json["service"],
      date: json['date'],
      image: json['image'],
      license: json['license'],
      location: json['location'],
      make: json['make'],
      model: json['model'],
      name: json['name'],
      phone: json['phone'],
      price: json['price'],
      requiredTime: json['requiredTime'],
      status: json['status'],
      time: json['time'],
      yom: json['yom'],
    );
  }
}
