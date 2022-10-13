import 'package:flutter/cupertino.dart';
import 'package:notey_app/data/controller/base_controller.dart';
import 'package:notey_app/data/models/response_model.dart';
import 'package:notey_app/data/models/task_model.dart';
import 'package:notey_app/data/network/api/task_api.dart';
import 'package:notey_app/utils/helper.dart';

class TaskController with ChangeNotifier, BaseController {
  List<TaskModel> tasks = [];
  bool loading = false;
  bool update = false;

  TaskModel taskUpdate = TaskModel();
  clear() {
    tasks.clear();
    notifyListeners();
  }

  featchTasks() async {
    try {
      loading = true;
      var response = await TaskApi().featchTasks();
      if (response["data"].isNotEmpty) {
        List<dynamic> dataResponse = response["data"];
        dataResponse
            .map((element) => tasks.add(TaskModel.fromJson(element)))
            .toList();
        notifyListeners();
        MessageHelper.showSnackBarMessage(
            message: response["message"], status: response["status"]);
      }
    } catch (error) {
      handleError(error);
    }
    loading = false;
    notifyListeners();
  }

  createTask({required String title}) async {
    try {
      loading = true;
      notifyListeners();
      var response = await TaskApi().createTask(title: title);
      if (response["status"]) {
        TaskModel newTask = TaskModel.fromJson(response["data"]);
        tasks.add(newTask);
        notifyListeners();

        MessageHelper.showSnackBarMessage(
            message: response["message"], status: response["status"]);
      }
    } catch (error) {
      handleError(error);
    }
    loading = false;
    notifyListeners();
  }

  upadteTask({required String title, required int id}) async {
    try {
      loading = true;
      notifyListeners();
      var response = await TaskApi().updateTask(title: title, id: id);
      if (response["status"]) {
        TaskModel taskModel = await featchSingleTask(id);
        int taskIndex = tasks.indexWhere((element) => element.id == id);
        tasks[taskIndex] = taskModel;
        notifyListeners();
        ResponseModel responseModel = ResponseModel.fromJson(response);
        MessageHelper.showSnackBarMessage(
            message: responseModel.message, status: responseModel.status);
      }
      notifyListeners();
    } catch (error) {
      handleError(error);
    }
    loading = false;
    update = false;
    notifyListeners();
  }

  deleteTask({required int id}) async {
    dynamic response = await TaskApi().deleteTask(id: id);
    ResponseModel responseModel = ResponseModel.fromJson(response);
    if (responseModel.status) {
      int taskIndex = tasks.indexWhere((element) => element.id == id);
      print(taskIndex);
      tasks.removeAt(taskIndex);
      notifyListeners();
      MessageHelper.showSnackBarMessage(
          message: responseModel.message, status: responseModel.status);
    }
  }

  featchSingleTask(int id) async {
    try {
      var response = await TaskApi().featchTasks();

      List<dynamic> dataResponse = response["data"];
      late TaskModel task;
      for (var element in dataResponse) {
        if (TaskModel.fromJson(element).id == id) {
          task = TaskModel.fromJson(element);
        }
      }
      notifyListeners();
      return task;
    } catch (error) {
      handleError(error);
    }
    loading = false;
    notifyListeners();
  }
}
