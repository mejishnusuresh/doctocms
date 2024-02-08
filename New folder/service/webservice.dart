// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:project1/model/listappointmentmodel.dart';
// import 'package:project1/model/listpatientmodel.dart';
//
// import '../model/loginmodel.dart';
//
// class Webservice {
//
//   Future<Map<String, dynamic>> login(
//       String username, String password, String clinicId) async {
//     var result;
//
//     final Map<String, dynamic> logindata = {
//       "username": username,
//       "password": password,
//       "clinicId": clinicId,
//     };
//
//     // String raw=jsonEncode(logindata);
//     // print(raw);
//     // print(jsonDecode(raw));
//
//     print(logindata.toString());
//
//     var token =
//         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//     String basicAuth = 'Basic ' + token;
//     print(basicAuth);
//     final url =
//         "https://app.doctosmart.com/api/authentication/login?username=$username&password=$password&clinic_id=$clinicId";
//     final response = await http.post(Uri.parse(url),
//
//
//
//         body:logindata.toString(),
//
//         // headers: {'Content-Type': 'application/json'}
//         headers: {'Authorization': 'Basic $token'});
//
//
//
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       print("inside 200");
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//
//
//       // print(
//       //     "status code ________" + response.statusCode.toString());
//       //   print("response ______" + response.body.toString());
//       var userData = responseData;
//
//       // print("userData :" + userData.toString());
//
//       log user = log.fromJson(userData);
//
//       //var userData = log.fromJson(jsonDecode(response.body));
//       result = {'status': true, 'message': 'Successful', 'user': user};
//     } else {
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }
//
//   //patient list
//
//   Future<Map<String, dynamic>> patient(String userId, String clinicId) async {
//     var result;
//
//     // String raw=jsonEncode(logindata);
//     // print(raw);
//     // print(jsonDecode(raw));
//
//     var token =
//         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//     String basicAuth = 'Basic ' + token;
//     print(basicAuth);
//     final url =
//         "https://app.doctosmart.com/api/patients?user_id=$userId&clinic_id=$clinicId";
//     final response = await http.get(Uri.parse(url),
//
//         // headers: {'Content-Type': 'application/json'}
//         headers: {'Authorization': 'Basic $token'});
//
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       print("inside 200");
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//       // print(
//       //     "status code ________" + response.statusCode.toString());
//       //   print("response ______" + response.body.toString());
//       var userData = responseData;
//
//       // print("userData :" + userData.toString());
//
//       patientmodel user = patientmodel.fromJson(userData);
//
//       //var userData = log.fromJson(jsonDecode(response.body));
//       result = {'status': true, 'message': 'Successful', 'user': user};
//     } else {
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }
//
//
//
//   //Adding patient
//
//   var pic;
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
//     var token =
//         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//     var request = http.MultipartRequest(
//         "POST", Uri.parse("https://app.doctosmart.com/api/patients?"));
//     //var request = http.MultipartRequest("POST", Uri.parse("http://192.168.136.62:8080/dr_thayyari/dr_reg_withimage"));
//     request.headers['Authorization'] = 'Basic $token';
//
//     pic = await http.MultipartFile.fromPath(
//         "profile_picture", profilePicture.path.toString());
//     request.fields['patient_name'] = patientName;
//     request.fields['date_of_birth'] = dateOfBirth;
//     request.fields['email'] = email;
//     request.fields['mobile_no'] = mobileNo;
//     request.fields['address'] = address;
//     request.fields['gender'] = gender;
//     request.fields['age'] = age;
//     request.files.add(pic);
//     request.fields['clinic_id'] = clinicId;
//     request.fields['user_id'] = userId;
//
//     var response = await request.send();
//
//     var responseData = await response.stream.toBytes();
//     var responseString = String.fromCharCodes(responseData);
//     print("aks" + responseString.toString());
//     Map<String, dynamic> result;
//
//     if (response.statusCode == 200) {
//       result = {
//         'status': true,
//         'message': 'Successful',
//         'user': responseString
//       };
//     } else {
//       result = {'status': false, 'message': "error"};
//     }
//     return result;
//   }
//
//   //add appointments
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
//     var token =
//         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//
//     var request = http.MultipartRequest(
//         'POST',
//         Uri.parse(
//             "https://app.doctosmart.com/api/patients_details?user_id=$userId&clinic_id=$clinicId&tab=$tab&patient_id=$patientId&start_date=$startDate&patient_name=$patientName&purpose_visit=$purposeVisit&doctor_id=$doctorId"));
//     request.headers['Authorization'] = 'Basic $token';
//
//     request.fields['tab'] = "appointment";
//     request.fields['startDate'] = startDate;
//     request.fields['patientId'] = patientId;
//     request.fields['patientName'] = patientName;
//     request.fields['purposeVisit'] = purposeVisit;
//     request.fields['userId'] = userId;
//     request.fields['clinicId'] = clinicId;
//
//     var response = await request.send();
//
//     var responseData = await response.stream.toBytes();
//     var responseString = String.fromCharCodes(responseData);
//     print("aks" + responseString.toString());
//     Map<String, dynamic> result;
//
//     if (response.statusCode == 200) {
//       result = {
//         'status': true,
//         'message': 'succesfull',
//         'user': responseString
//       };
//     } else {
//       result = {'status': false, 'message': 'error'};
//     }
//     return result;
//   }
//
//   //Appointments
//
//   Future<Map<String, dynamic>> appointments(String patientId, String clinicId,
//       String userId, String startDate) async {
//     var result;
//
//     // String raw=jsonEncode(logindata);
//     // print(raw);
//     // print(jsonDecode(raw));
//
//     var token =
//         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//     String basicAuth = 'Basic ' + token;
//     print(basicAuth);
//     final url =
//         "https://app.doctosmart.com/api/patients_details?start_date=$startDate&tab=appointment&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId";
//     final response = await http.get(Uri.parse(url),
//
//         // headers: {'Content-Type': 'application/json'}
//         headers: {'Authorization': 'Basic $token'});
//
//     print(response.statusCode);
//     if (response.statusCode == 200) {
//       print("inside 200");
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//       // print(
//       //     "status code ____________________" + response.statusCode.toString());
//       //   print("response ______________" + response.body.toString());
//       var userData = responseData;
//
//       // print("userData :" + userData.toString());
//
//       AppointmentsCard user = AppointmentsCard.fromJson(userData);
//
//       //var userData = log.fromJson(jsonDecode(response.body));
//       result = {'status': true, 'message': 'Successful', 'user': user};
//     } else {
//       result = {
//         'status': false,
//         'message': json.decode(response.body)['error']
//       };
//     }
//     return result;
//   }
//
//   //doctors list
//
//   // Future<Map<String, dynamic>> doctors(
//   //     String userId,
//   //     String clinicId,
//   //     ) async {
//   //   var result;
//   //
//   //   // String raw=jsonEncode(logindata);
//   //   // print(raw);
//   //   // print(jsonDecode(raw));
//   //
//   //   var token =
//   //       "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
//   //   String basicAuth = 'Basic ' + token;
//   //   print(basicAuth);
//   //   final url = "https://app.doctosmart.com/api/users?clinic_id=$clinicId";
//   //   final response = await http.get(Uri.parse(url),
//   //
//   //       // headers: {'Content-Type': 'application/json'}
//   //       headers: {'Authorization': 'Basic $token'});
//   //
//   //   print(response.statusCode);
//   //   if (response.statusCode == 200) {
//   //     print("inside 200");
//   //     final Map<String, dynamic> responseData = jsonDecode(response.body);
//   //
//   //     // print(
//   //     //     "status code ____________________" + response.statusCode.toString());
//   //     //   print("response ______________" + response.body.toString());
//   //     var userData = responseData;
//   //
//   //     // print("userData :" + userData.toString());
//   //
//   //     DoctorList user = DoctorList.fromJson(userData);
//   //
//   //     //var userData = log.fromJson(jsonDecode(response.body));
//   //     result = {'status': true, 'message': 'Successful', 'user': user};
//   //   } else {
//   //     result = {
//   //       'status': false,
//   //       'message': json.decode(response.body)['error']
//   //     };
//   //   }
//   //   return result;
//   // }
//
//   //COMPLAINT MORE LIST
//
// //   Future<Map<String, dynamic>> complaintmore(userId, clinicId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/master?tab=clinical_notes&clinic_id=$clinicId&user_id=$userId&search_in=r&page_no=0&notes_type=complaints";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //
// //       ComplaintList user = ComplaintList.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
// //
// // // Observation more list
// //
// //   Future<Map<String, dynamic>> observationmore(userId, clinicId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/master?tab=clinical_notes&clinic_id=$clinicId&user_id=$userId&search_in=r&page_no=0&notes_type=observation";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //
// //       ObservationList user = ObservationList.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
// //
// //   // Investigation list
// //
// //   Future<Map<String, dynamic>> investigationmore(userId, clinicId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/master?tab=clinical_notes&clinic_id=$clinicId&user_id=$userId&search_in=r&page_no=0&notes_type=investigation";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //
// //       InvestigationList user = InvestigationList.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
// //
// //   //Diagnosis more list
// //   Future<Map<String, dynamic>> diagnosismore(userId, clinicId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/master?tab=clinical_notes&clinic_id=$clinicId&user_id=$userId&search_in=r&page_no=0&notes_type=diagnosis";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //
// //       DiagnosisList user = DiagnosisList.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
// //
// //   // Clinical note
// //   Future<Map<String, dynamic>> clinic(userId, clinicId, patientId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/patients_details?tab=clinical_note&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId&page_no=0";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //       ClinicNote user = ClinicNote.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
// //
// //   //TREATMENT LIST
// //   Future<Map<String, dynamic>> Treatment(userId, clinicId, patientId) async {
// //     var result;
// //
// //     // String raw=jsonEncode(logindata);
// //     // print(raw);
// //     // print(jsonDecode(raw));
// //
// //     var token =
// //         "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
// //     String basicAuth = 'Basic ' + token;
// //     print(basicAuth);
// //     final url =
// //         "https://app.doctosmart.com/api/patients_details?tab=emr&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId";
// //     final response = await http.get(Uri.parse(url),
// //
// //         // headers: {'Content-Type': 'application/json'}
// //         headers: {'Authorization': 'Basic $token'});
// //
// //     print(response.statusCode);
// //     if (response.statusCode == 200) {
// //       print("inside 200");
// //       final Map<String, dynamic> responseData = jsonDecode(response.body);
// //
// //       // print(
// //       //     "status code ____________________" + response.statusCode.toString());
// //       //   print("response ______________" + response.body.toString());
// //       var userData = responseData;
// //
// //       // print("userData :" + userData.toString());
// //       TreatmentC user = TreatmentC.fromJson(userData);
// //
// //       //var userData = log.fromJson(jsonDecode(response.body));
// //       result = {'status': true, 'message': 'Successful', 'user': user};
// //     } else {
// //       result = {
// //         'status': false,
// //         'message': json.decode(response.body)['error']
// //       };
// //     }
// //     return result;
// //   }
//
//
//
//
//
//
//
// }