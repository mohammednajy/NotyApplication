import '../../utils/helper.dart';
import '../network/api_exception.dart';

class BaseController {
  void handleError(error) {
    if (error is BadRequestException) {
      MessageHelper.showSnackBarMessage(
          message: error.message.toString(), status: false);
    } else if (error is FetchDataException) {
      MessageHelper.showSnackBarMessage(
          message: error.message.toString(), status: false);
    } else if (error is ApiNotResponseException) {
      MessageHelper.showSnackBarMessage(
          message: error.message.toString(), status: false);
    } else {
      MessageHelper.showSnackBarMessage(
          message: "something went wrong ", status: false);
    }
  }
}
