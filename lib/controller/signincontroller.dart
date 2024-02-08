import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class signinController extends GetxController {
  static signinController get to => Get.find();

  Future<Map<String, dynamic>> signin(
      String clinicName,
      String clinicType,
      String doctorName,
      String email,
      String password,
      String confirmPassword,) async {
    final results = await Webservice().signin(clinicName, clinicType, doctorName, email, password, confirmPassword);

    return results;
  }
}