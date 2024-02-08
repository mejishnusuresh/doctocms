import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class appointmentController extends GetxController {
  static appointmentController get to => Get.find();

  Future<Map<String, dynamic>> listappointment(String patientId,
      String clinicId,
      String userId,
      String startDate) async {
    final results = await Webservice().listappointment(
        patientId, clinicId, userId, startDate);

    return results;
  }
}