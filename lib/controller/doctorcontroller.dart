import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class doctorController extends GetxController {
  static doctorController get to => Get.find();

  Future<Map<String, dynamic>> listdoctor(
      String userId ,
      String clinicId,
      ) async {
    final results = await Webservice().listdoctor(userId,clinicId);

    return results;
  }
}