class PackageResponseModel {
  final List<PackageModel> package;
  final int total;

  PackageResponseModel({
    required this.package,
    required this.total,
  });

factory PackageResponseModel.fromJson(Map<String, dynamic> json) {
  var packageList = json["products"] as List;
  List<PackageModel> packages = packageList.map((i) => PackageModel.fromJson(i)).toList();

  return PackageResponseModel(
    package: packages,
    total: json["total"],
  );
}

}

class PackageModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final String price;
  final String thumbnail_url;
  final List<String> image_url;

  PackageModel({
    required this.description,
    required this.id,
    required this.category,
    required this.price,
    required this.title,
    required this.thumbnail_url,
    required this.image_url,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesFromJson = json["images"];
    List<String> images = imagesFromJson.map((image) => image as String).toList();

    return PackageModel(
      description: json["description"],
      id: json["id"],
      category: json["category"],
      price: json["price"].toString(), // Ensuring price is a String
      title: json["title"],
      thumbnail_url: json["thumbnail"],
      image_url: images,
    );
  }
}
