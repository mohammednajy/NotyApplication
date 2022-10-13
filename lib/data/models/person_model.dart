class PersonModel {
  final int id;
  final String fullName;
  final String email;
  final String gender;
  String? fcmToken;
  final String token;
  final String refreshToken;
  final bool isActive;

  PersonModel(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.gender,
      this.fcmToken,
      required this.token,
      required this.refreshToken,
      required this.isActive});

  factory PersonModel.fromJson(Map<String, dynamic> jsonMap) {
    return PersonModel(
        id: jsonMap["id"],
        fullName: jsonMap["full_name"],
        email: jsonMap["email"],
        gender: jsonMap["gender"],
        token: jsonMap["token"],
        refreshToken: jsonMap["refresh_token"],
        isActive: jsonMap["is_active"]);
  }
}
