class OrderResponseModel {
  final int id;
  final int status;
  final int package_id;

  OrderResponseModel(
      {required this.id, required this.package_id, required this.status});

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderResponseModel(
        id: json["id"],
        package_id: json["package_id"],
        status: json["status_id"]);
  }
}
