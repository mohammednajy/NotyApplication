class ResponseModel {
  final bool status;
  final String message;

  ResponseModel({
    required this.status,
    required this.message,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> josnMap) {
    return ResponseModel(
        status: josnMap["status"], message: josnMap["message"]);
  }
}
