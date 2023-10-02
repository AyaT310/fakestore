class Products {
  String? image;
  String? title;
  String? description;
  dynamic price;

  Products({this.image, this.price, this.title, this.description});

  factory Products.fromJson(Map<String, dynamic> data) {
    return Products(
      image: data["image"],
      price: data["price"],
      title: data["title"],
      description: data["description"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "image": image,
  //     "price": price,
  //     "title": title,
  //     "description": description,
  //   };
  // }
}
