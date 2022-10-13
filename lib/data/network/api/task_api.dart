import 'package:notey_app/data/network/base_client.dart';
import 'package:notey_app/data/network/endpoints.dart';

import '../../local_storage/shared_perferance.dart';

class TaskApi {
  Future<dynamic> featchTasks() async {
    return await ClientBase().get(Endpoints.task, headers: {
      "Authorization": SharedPref().getToken,
      "accept": "application/json"
    });
  }

  Future<dynamic> createTask({required String title}) async {
    return await ClientBase().post(Endpoints.task, body: {
      "title": title
    }, headers: {
      "Authorization": SharedPref().getToken,
      "accept": "application/json"
    });
  }

  Future<dynamic> updateTask({required String title, required int id}) async {
    return await ClientBase().put("${Endpoints.task}/$id", body: {
      "title": title
    }, headers: {
      "Authorization": SharedPref().getToken,
      "accept": "application/json",
      'Content-Type': 'application/x-www-form-urlencoded'
    });
  }

   Future<dynamic> deleteTask({required int id}) async {
    return await ClientBase().delete("${Endpoints.task}/$id", headers: {
      "Authorization": SharedPref().getToken,
      "accept": "application/json",
      'Content-Type': 'application/x-www-form-urlencoded'
    });
  }
}
