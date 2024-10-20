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

class AIResponseModel{
  final response;
  AIResponseModel({
    required this.response,
  });
  factory AIResponseModel.fromJson(Map<String, dynamic> json){
    return AIResponseModel(response: json["response"]);
  }
}