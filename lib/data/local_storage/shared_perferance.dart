import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { logedIn, token, name, eamil }

class SharedPref {
  static final _instance = SharedPref._();

  factory SharedPref() {
    return _instance;
  }

  late SharedPreferences preferences;
  SharedPref._();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  save(
      {required bool loged,
      required String token,
      required String name,
      required String email}) async {
    await preferences.setBool(PrefKeys.logedIn.toString(), true);
    await preferences.setString(PrefKeys.token.toString(), "Bearer $token");
    await preferences.setString(PrefKeys.name.toString(), name);
    await preferences.setString(PrefKeys.eamil.toString(), email);
  }

  logedOut() async {
    await preferences.setBool(PrefKeys.logedIn.toString(), false);
  }

  bool get getLogedIn =>
      preferences.getBool(PrefKeys.logedIn.toString()) ?? false;

  String get getToken =>
      preferences.getString(PrefKeys.token.toString()) ?? "test";

  String get getEmail =>
      preferences.getString(PrefKeys.eamil.toString()) ?? "test@gamil.com";

  String get getName =>
      preferences.getString(PrefKeys.name.toString()) ?? "mohammed";
}
