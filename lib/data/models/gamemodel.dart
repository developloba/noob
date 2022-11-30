class Gamemodel {
  int id;

  String image;

  String name;

  double rating;

  Gamemodel(
      {required this.id,
      required this.name,
      required this.image,
      required this.rating});

  factory Gamemodel.fromJson(Map<String, dynamic> json) {
    return Gamemodel(
        id: json["id"],
        name: json['name'],
        image: json['image'],
        rating: json['rating']);
  }
}
