// import 'package:get/get.dart';
//
// import '../service/webservice.dart';
//
// class PatientController extends GetxController {
//   static PatientController get to => Get.find();
//
//   Future<Map<String, dynamic>> patient(String userId, String clinicId) async {
//     final results = await Webservice().patient(userId, clinicId);
//
//     return results;
//   }
//
//   Future<Map<String, dynamic>> addpatients(
//       String patientName,
//       String dateOfBirth,
//       String email,
//       String mobileNo,
//       String address,
//       String gender,
//       profilePicture,
//       String age,
//       String clinicId,
//       String userId) async {
//       final results = await Webservice().addpatients(
//           patientName,
//           dateOfBirth,
//           email,
//           mobileNo,
//           address,
//           gender,
//           profilePicture,
//           age,
//           clinicId,
//           userId
//       );
//       return results;
//   }
// }