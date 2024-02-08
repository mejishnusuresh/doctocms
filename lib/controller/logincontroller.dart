import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class loginController extends GetxController {
  static loginController get to => Get.find();

  Future<Map<String, dynamic>> login(
      String username,
      String password,
      String clinicId
      ) async {
    final results = await Webservice().login(username, password, clinicId);

    return results;
  }
}