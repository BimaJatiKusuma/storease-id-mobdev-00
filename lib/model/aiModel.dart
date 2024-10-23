class AIRequestModel{
  String message;
  AIRequestModel({
    required this.message
  });
    Map<String, dynamic> toJson() {
    return {
      "message": message.trim(),
    };
  }
}

class AIOrderRequestModel{
  String message;
  int id_package;
  AIOrderRequestModel({
    required this.message,
    required this.id_package
  });
    Map<String, dynamic> toJson() {
    return {
      "message": message.trim(),
      "id_package": id_package,
    };
  }
}

class AIResponseModel{
  final response;
  AIResponseModel({
    required this.response,
  });
  factory AIResponseModel.fromJson(Map<String, dynamic> json){
    return AIResponseModel(response: json["response"]);
  }
}

