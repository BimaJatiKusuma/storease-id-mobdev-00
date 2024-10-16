class PackageResponseModel {
  final List<PackageCategoryModel> packageCategory;
  final String message;

  PackageResponseModel({
    required this.packageCategory,
    required this.message,
  });
  factory PackageResponseModel.fromJson(Map<String, dynamic> json) {
    // Directly check if "data" is a list
    var categoryList = json["data"] as List<dynamic>;

    List<PackageCategoryModel> category =
        categoryList.map((i) => PackageCategoryModel.fromJson(i)).toList();

    return PackageResponseModel(
      packageCategory: category,
      message: json["message"],
    );
  }

// factory PackageResponseModel.fromJson(Map<String, dynamic> json) {
//   var categoryList = json["data"] as List;
//   List<PackageCategoryModel> category = categoryList.map((i) => PackageCategoryModel.fromJson(i)).toList();

//   return PackageResponseModel(
//     packageCategory: category,
//     message: json["messages"],
//   );
// }
}

class PackageDetailResponseModel {
  final PackageModel package;
  final String message;

  PackageDetailResponseModel({
    required this.package,
    required this.message,
  });
  factory PackageDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return PackageDetailResponseModel(
      package: PackageModel.fromJson(json["data"]),
      message: json["message"],
    );
  }
}

class PackageCategoryModel {
  final int id;
  final String name;
  final List<PackageModel> packages;

  PackageCategoryModel(
      {required this.id, required this.name, required this.packages});

  factory PackageCategoryModel.fromJson(Map<String, dynamic> json) {
    var packageList = json["package"] as List;
    List<PackageModel> packages =
        packageList.map((i) => PackageModel.fromJson(i)).toList();

    return PackageCategoryModel(
        id: json["id"], name: json["name"], packages: packages);
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
    List<dynamic> imagesFromJson = json["preview_url"];
    List<String> images =
        imagesFromJson.map((image) => image as String).toList();

    return PackageModel(
      description: json["description"],
      id: json["id"],
      category: json["package_category_id"],
      price: json["price"].toString(), // Ensuring price is a String
      title: json["name"],
      thumbnail_url:
          images.isNotEmpty ? images[0] : "https://picsum.photos/200/300",
      image_url: images.isNotEmpty
          ? images
          : ["https://picsum.photos/200/300", "https://picsum.photos/200/300"],
    );
  }
}
