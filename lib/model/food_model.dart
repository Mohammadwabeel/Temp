class FoodModel {
  FoodModel({
    required this.id,
    required this.title,
    required this.price,
    required this.images,
    required this.description,
    required this.vitamins,
    required this.minerals,
    required this.pros,
    required this.cons,
  });
  late final int id;
  late final String title;
  late final String price;
  late final List<String> images;
  late final String description;
  late final List<String> vitamins;
  late final List<String> minerals;
  late final List<String> pros;
  late final List<String> cons;

  static FoodModel? fromJsonData(Map<String, dynamic> json) {
    try {
      return FoodModel(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        images: json['images'].runtimeType == String
            ? [json['images']]
            : List.castFrom<dynamic, String>(json['images']),
        description: json['description'],
        vitamins: json['vitamins'] != null ? json['vitamins'].split(",") : [],
        minerals: json['minerals'] != null ? json['minerals'].split(",") : [],
        pros: List.castFrom<dynamic, String>(json['pros']),
        cons: List.castFrom<dynamic, String>(json['Cons']),
      );
    } catch (e) {
      return null;
    }
  }
}
