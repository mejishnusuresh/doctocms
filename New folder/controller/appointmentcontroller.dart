//
// import 'package:get/get.dart';
// import 'package:project1/service/webservice.dart';
//
// class AppointmentController extends GetxController {
//   static AppointmentController get to => Get.find();
//   Future<Map<String, dynamic>> appointments(String patientId, String clinicId,
//       String userId, String startDate) async {
//     final results =
//     await Webservice().appointments(patientId, clinicId, userId, startDate);
//     return results;
//   }
//
//   Future<Map<String, dynamic>> addappointments(
//       String tab,
//       String startDate,
//       String patientId,
//       String patientName,
//       String purposeVisit,
//       String userId,
//       String clinicId,
//       String doctorId,
//       ) async {
//     final results = await Webservice().addappointments(tab, startDate, patientId,
//         patientName, purposeVisit, userId, clinicId, doctorId);
//
//     return results;
//   }
//
// }
