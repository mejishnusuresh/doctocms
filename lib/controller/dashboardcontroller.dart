import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class dashboardController extends GetxController {
  static dashboardController get to => Get.find();

  Future<Map<String, dynamic>> listdashboard(
      String clinicId,
      String userId,
      String startDate,
      String type,
      ) async {
    final results = await Webservice().listdashboard(clinicId, userId, startDate,type);

    return results;
  }
}