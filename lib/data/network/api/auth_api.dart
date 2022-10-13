import 'package:notey_app/data/local_storage/shared_perferance.dart';
import 'package:notey_app/data/network/endpoints.dart';
import '../base_client.dart';

class AuthApi {
  Future<dynamic> login(
      {required String email, required String password}) async {
    return await ClientBase()
        .post(Endpoints.loginUrl, body: {"email": email, "password": password});
  }

  Future<dynamic> logOut() async {
    var response = await ClientBase().get(Endpoints.logout, headers: {
      "Authorization": SharedPref().getToken,
      "accept": "application/json"
    });
    return response;
  }

  Future<dynamic> singUp({
    required String fullName,
    required String email,
    required String password,
    required String gender,
  }) async {
    return await ClientBase().post(Endpoints.singUp, body: {
      "full_name": fullName,
      "email": email,
      "password": password,
      "gender": gender
    });
  }

  Future<dynamic> forgetPassword({required String email}) async {
    return await ClientBase().post(Endpoints.forget, body: {"email": email});
  }

  Future<dynamic> resetPassowrd(
      {required String email,
      required String code,
      required String password}) async {
    var response = await ClientBase().post(Endpoints.reset, body: {
      "email": email,
      "code": code,
      "password": password,
      "password_confirmation": password
    });
    return response;
  }
}
