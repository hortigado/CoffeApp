class CoffeModel {
  String title;
  int price;
  String img;
  CoffeModel({
    this.title,
    this.price,
    this.img,
  });
  static CoffeModel fromJson(Map<String, dynamic> json) {
    return CoffeModel(
      title: json["title"],
      price: json["price"],
      img: json["img"],
    );
  }
}
