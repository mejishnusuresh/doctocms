import 'package:get/get.dart';
import 'package:project1/model/patient/listpatientmodel.dart';
import 'package:project1/service/webservice.dart';

class patientController extends GetxController {
  static patientController get to => Get.find();

  Future<Map<String, dynamic>> listpatient(
      String userId ,
      String clinicId,
      ) async {
    final results = await Webservice().listpatient(userId, clinicId);

    return results;
  }

  Future<Map<String, dynamic>> addpatient(
      String patientName,
      String dateOfBirth,
      String email,
      String mobileNo,
      String address,
      String gender,
      String age,
      String clinicId,
      String userId,
      profilePicture,
      ) async {

    final results = await Webservice().addpatient(patientName,dateOfBirth, email, mobileNo, address, gender, age, profilePicture, clinicId, userId);
    return results;
  }

  Future<Map<String, dynamic>> editpatient(
      String patientId,
      String patientName,
      String clinicId,
      String userId,
      ) async {

    final results = await Webservice().editpatient(patientId,clinicId, userId, patientName);
    return results;
  }

  Future<Map<String, dynamic>> deletepatient(
      String clinicId,
      String userId,
      String patientId,
      ) async {

    final results = await Webservice().deletepatient(clinicId, userId,patientId);
    return results;
  }

  Future<Map<String, dynamic>> listpatientdetails(
      String patientId,
      String clinicId,
      String userId,
      ) async {

    final results = await Webservice().listpatientdetails(patientId,clinicId, userId);
    return results;
  }
}