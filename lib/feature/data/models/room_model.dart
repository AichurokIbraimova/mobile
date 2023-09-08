class Room {
  int id;
  String name;
  int price;
  String pricePer;
  List<String> peculiarities;
  List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        pricePer: json["price_per"],
        peculiarities: List<String>.from(json["peculiarities"].map((x) => x)),
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "price_per": pricePer,
        "peculiarities": List<dynamic>.from(peculiarities.map((x) => x)),
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
      };
}
