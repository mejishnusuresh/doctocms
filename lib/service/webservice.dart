import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1/model/patient/tabs/addappoinmentmodel.dart';
import 'package:project1/model/patient/tabs/addattachmentmodel.dart';
import 'package:project1/model/patient/tabs/cancelappointmentmodel.dart';
import 'package:project1/model/patient/tabs/listappointmentdetailsmodel.dart';
import 'package:project1/model/listdashboardmodel.dart';
import 'package:project1/model/other/listdocumenttypemodel.dart';
import 'package:project1/model/other/listemrmastermodel.dart';
import 'package:project1/model/other/listprescriptionmastermodel.dart';
import 'package:project1/model/patient/addpatientmodel.dart';
import 'package:project1/model/appointment/listappointmentmodel.dart';
import 'package:project1/model/patient/deletepatientmodel.dart';
import 'package:project1/model/doctor/listdoctormodel.dart';
import 'package:project1/model/patient/editpatientmodel.dart';
import 'package:project1/model/patient/listpatientdetailsmodel.dart';
import 'package:project1/model/auth/loginmodel.dart';
import 'package:project1/model/patient/listpatientmodel.dart';
import 'package:project1/model/auth/signinmodel.dart';
import 'package:project1/model/patient/tabs/addclinicalnotemodel.dart';
import 'package:project1/model/patient/tabs/addpaymentmodel.dart';
import 'package:project1/model/patient/tabs/addprescriptionmodel.dart';
import 'package:project1/model/patient/tabs/addtreatmentmodel.dart';
import 'package:project1/model/patient/tabs/listattachmentdetailsmodel.dart';
import 'package:project1/model/patient/tabs/listattchmentmodel.dart';
import 'package:project1/model/patient/tabs/listclinicalnotedetailsmodel.dart';
import 'package:project1/model/patient/tabs/listclinicalnotemodel.dart';
import 'package:project1/model/patient/tabs/listpaymentdetailsmodel.dart';
import 'package:project1/model/patient/tabs/listpaymentmodel.dart';
import 'package:project1/model/patient/tabs/listpendinginvoicemodel.dart';
import 'package:project1/model/patient/tabs/listprescriptiondetailsmodel.dart';
import 'package:project1/model/patient/tabs/listprescriptionmodel.dart';
import 'package:project1/model/patient/tabs/listtreatmentdetailsmodel.dart';
import 'package:project1/model/patient/tabs/listtreatmentmodel.dart';

class Webservice {

  ///  AUTH  ///

  //signup
  Future<Map<String, dynamic>> signin(
      String clinicName,
      String clinicType,
      String doctorName,
      String email,
      String password,
      String confirmPassword) async {
    var result;

    final Map<String, dynamic> signindata = {
      "clinicName": clinicName,
      "clinicType": clinicType,
      "doctorName": doctorName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    };

    print(signindata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/signup?clinic_name=$clinicName&clinic_type=$clinicType&doctor_name=$doctorName&email=$email&password=$password&confirm_password=$confirmPassword";
    final response = await http.post(Uri.parse(url),
        body: signindata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      SigninModel user = SigninModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //login
  Future<Map<String, dynamic>> login(
      String username,
      String password,
      String clinicId
      ) async {
    var result;

    final Map<String, dynamic> logindata = {
      "username": username,
      "password": password,
      "clinicId": clinicId,
    };

    print(logindata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/authentication/login?username=$username&password=$password&clinic_id=$clinicId";
    final response = await http.post(Uri.parse(url),
        body: logindata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      LoginModel user = LoginModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }



  ///  PATIENT  ///

  //add patient
  var pic;
  Future<Map<String, dynamic>> addpatient(
      String patientName,
      String dateOfBirth,
      String email,
      String mobileNo,
      String address,
      String gender,
      String age,
      profilePicture,
      String clinicId,
      String userId
      ) async {

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    var request =
        http.MultipartRequest("POST", Uri.parse("https://app.doctosmart.com/api/patients?"));
    request.headers['Authorization'] = 'Basic $token';

    pic = await http.MultipartFile.fromPath("profile_picture", profilePicture.path.toString());
    request.fields['patient_name'] = patientName;
    request.fields['date_of_birth'] = dateOfBirth;
    request.fields['email'] = email;
    request.fields['mobile_no'] = mobileNo;
    request.fields['address'] = address;
    request.fields['gender'] = gender;
    request.fields['age'] = age;
    request.fields['clinic_id'] = clinicId;
    request.fields['user_id'] = userId;
    request.files.add(pic);

    var response = await request.send();

    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print("test" + responseString.toString());
    Map<String, dynamic> result;

    //AddPatientModel user = AddPatientModel.fromJson(userData);

    if (response.statusCode == 200) {
      result = {
        'status': true,
        'message': 'Successful',
        'user': responseString
      };
    } else {
      result = {'status': false, 'message': "error"};
    }
    return result;
  }

  //list patient
  Future<Map<String, dynamic>> listpatient(
      String userId,
      String clinicId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients?user_id=$userId&clinic_id=$clinicId&page_no=0";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPatientModel user = ListPatientModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //edit patient
  Future<Map<String, dynamic>> editpatient(
      String patientId,
      String clinicId,
      String userId,
      String patientName,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients?patient_id=$patientId&clinic_id=$clinicId&user_id=$userId&patient_name=$patientName";
    final response = await http.put(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      EditPatientModel user = EditPatientModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //delete patient
  Future<Map<String, dynamic>> deletepatient(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients/$patientId?user_id=$userId&clinic_id=$clinicId";
    final response = await http.delete(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print("Response Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");


    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      DeletePatientModel user = DeletePatientModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list patient details
  Future<Map<String, dynamic>> listpatientdetails(
      String patientId,
      String userId,
      String clinicId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients?patient_id=$patientId&user_id=$userId&clinic_id=$clinicId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPatientDetailsModel user = ListPatientDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }



  ///  APPOINTMENT  ///

  //add appointment
  Future<Map<String, dynamic>> addappointment(
      String userId,
      String clinicId,
      String patientId,
      String startDate,
      String patientName,
      String purposeVisit,
  ) async {
    var result;

    final Map<String, dynamic> addappointmentdata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "startDate": startDate,
      "patientName": patientName,
      "purposeVisit": purposeVisit,
    };

    print(addappointmentdata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?user_id=$userId&clinic_id=$clinicId&tab=appoinment&patient_id=$patientId&start_date=$startDate&patient_name=$patientName&purpose_visit=$purposeVisit";
    final response = await http.post(Uri.parse(url),
        body: addappointmentdata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddAppointmentModel user = AddAppointmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list appointment
  Future<Map<String, dynamic>> listappointment(
      String startDate,
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?start_date=$startDate&tab=appointment&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId&page_no=0";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListAppointmentModel user = ListAppointmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }



  ///  DOCTOR  ///

  //list doctor
  Future<Map<String, dynamic>> listdoctor(
      String userId,
      String clinicId,
      ) async {
    var result;

    var token = "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";

    String basicAuth = 'Basic ' + token;
    print(basicAuth);

    final url = "https://app.doctosmart.com/api/users?clinic_id=$clinicId";

    final response = await http.get(Uri.parse(url), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);

    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      var userData = responseData;
      ListDoctorModel user = ListDoctorModel.fromJson(userData);
      result = {'status': true, 'message': 'Success', 'user': user};
    } else {
      String errorMessage = 'An error occurred while fetching doctors.';
      if (response.statusCode == 401) {
        errorMessage = 'Unauthorized: Please check your authentication token.';
      } else if (response.statusCode == 404) {
        errorMessage = 'Not found: The clinic or resource was not found.';
      }

      result = {'status': false, 'message': errorMessage};
    }

    return result;
  }



  ///  TABS  ///

  //list clinicalnote
  Future<Map<String, dynamic>> listclinicalnote(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=clinical_note&user_$userId=1&clinic_id=$clinicId&patient_id=$patientId&page_no=0";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListClinicalNoteModel user = ListClinicalNoteModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }


  /// ////////////////////////////////////////////
  //add clinicalnote
  Future<Map<String, dynamic>> addclinicalnote(
      String userId,
      String clinicId,
      String patientId,
      String? doctorId,
      // String complaints,
      // String observation,
      // String investigation,
      // String diagnosis,
      ) async {
    var result;

    final Map<String, dynamic> addclinicalnotedata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "doctorId": doctorId,
      // "complaints": complaints,
      // "observation": observation,
      // "investigation": investigation,
      // "diagnosis": diagnosis,
    };

    print(addclinicalnotedata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=clinical_note&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId&complaints=complaints,test5&obseravetion=observation,test1&investigation=investigation&diagnosis=diagnosis,test4&doctor_id=$doctorId";
    final response = await http.post(Uri.parse(url),
        body: addclinicalnotedata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddClinicalNoteModel user = AddClinicalNoteModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }


  /// /////////////////////////
  //add treatment
  Future<Map<String, dynamic>> addtreatment(
      String userId,
      String clinicId,
      String patientId,
      String doctorId,
      // String totalAmount,
      // String treatment,
      // String treatmentName,
      // String itemUnit,
      // String itemPrice,
      // String itemTotalAmount,

      ) async {
    var result;

    final Map<String, dynamic> addtreatmentdata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "doctorId": doctorId,
    };

    print(addtreatmentdata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details";
    final response = await http.post(Uri.parse(url),
        body: addtreatmentdata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddTreatmentModel user = AddTreatmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list treatment
  Future<Map<String, dynamic>> listtreatment(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=emr&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListTreatmentModel user = ListTreatmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list treatment details
  Future<Map<String, dynamic>> listtreatmentdetails(
      String userId,
      String clinicId,
      String patientId,
      String emrId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=emr&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId&emr_id=$emrId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListTreatmentDetailsModel user = ListTreatmentDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }


  /// /////////////////////////////////////
  //add prescription
  Future<Map<String, dynamic>> addprescription(
      String userId,
      String clinicId,
      String patientId,
      String doctorId,
      // String totalAmount,
      // String drugs,
      // String drugName,
      // String duration,
      // String dosage,
      // String foodDuration,
      // String frequency,
      ) async {
    var result;

    final Map<String, dynamic> addprescriptiondata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "doctorId": doctorId,
    };

    print(addprescriptiondata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details";
    final response = await http.post(Uri.parse(url),
        body: addprescriptiondata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddPrescriptionModel user = AddPrescriptionModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list prescription
  Future<Map<String, dynamic>> listprescription(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=prescription&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPrescriptionModel user = ListPrescriptionModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list prescription details
  Future<Map<String, dynamic>> listprescriptiondetails(
      String userId,
      String clinicId,
      String patientId,
      String drugId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=prescription&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId&drug_id=$drugId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPrescriptionDetailsModel user = ListPrescriptionDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list pending invoice
  Future<Map<String, dynamic>> listpendinginvoice(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=pending_invoice&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPendingInvoiceModel user = ListPendingInvoiceModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list payment
  Future<Map<String, dynamic>> listpayment(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=payment&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPaymentModel user = ListPaymentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //add payment
  Future<Map<String, dynamic>> addpayment(
      String userId,
      String clinicId,
      String patientId,
      String invoiceId,
      String paidAmount,
      ) async {
    var result;

    final Map<String, dynamic> addpaymentdata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "invoiceId": invoiceId,
      "paidAmount": paidAmount,
    };

    print(addpaymentdata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=payment&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId&invoice_id=$invoiceId&paid_amount=$paidAmount";
    final response = await http.post(Uri.parse(url),
        body: addpaymentdata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddPaymentModel user = AddPaymentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list emr master
  Future<Map<String, dynamic>> listemrmaster(
      String userId,
      String clinicId,
      String searchIn,
      String notesType,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/master?tab=clinical_notes&clinic_id=$clinicId&user_id=$userId&search_in=$searchIn&page_no=0&notes_type=$notesType";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListEmrMasterModel user = ListEmrMasterModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //add attachment
  Future<Map<String, dynamic>> addattachment(
      String userId,
      String clinicId,
      String patientId,
      // String xinFile,
      // String documentId,
      ) async {
    var result;

    final Map<String, dynamic> addattachmentdata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      // "xinFile": xinFile,
      // "documentId": documentId,
    };

    print(addattachmentdata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details";
    final response = await http.post(Uri.parse(url),
        body: addattachmentdata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      AddAttachmentModel user = AddAttachmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list attachment
  Future<Map<String, dynamic>> listattachment(
      String userId,
      String clinicId,
      String patientId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?clinic_id=$clinicId&user_id=$userId&tab=attachment&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListAttachmentModel user = ListAttachmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list prescription master
  Future<Map<String, dynamic>> listprescriptionmaster(
      String userId,
      String clinicId,
      String searchIn,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/master?tab=prescription&clinic_id=$clinicId&user_id=$userId&page_no=0&search_in=$searchIn";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPrescriptionMasterModel user = ListPrescriptionMasterModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list document type
  Future<Map<String, dynamic>> listdocumenttype(
      String userId,
      String clinicId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/master?tab=document_type&clinic_id=$clinicId&user_id=$userId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListDocumentTypeModel user = ListDocumentTypeModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list appointment detils
  Future<Map<String, dynamic>> listappointmentdetails(
      String userId,
      String clinicId,
      String patientId,
      String startDate,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?start_date=$startDate&tab=appointment&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListAppointmentDetailsModel user = ListAppointmentDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list dashboard
  Future<Map<String, dynamic>> listdashboard(
      String userId,
      String clinicId,
      String startDate,
      String type,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/dashboard?start_date=$startDate&clinic_id=$clinicId&user_id=$userId&type=$type";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListDashboardModel user = ListDashboardModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list clinical note details
  Future<Map<String, dynamic>> listclinicalnotedetails(
      String userId,
      String clinicId,
      String patientId,
      String notesId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=clinical_note&user_id=$userId&clinic_id=$clinicId&patient_id=$patientId&notes_id=$notesId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListClinicalNoteDetailsModel user = ListClinicalNoteDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list payment details
  Future<Map<String, dynamic>> listpaymentdetails(
      String userId,
      String clinicId,
      String patientId,
      String paymentId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?tab=payment&clinic_id=$clinicId&user_id=$userId&patient_id=$patientId&payment_id=$paymentId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListPaymentDetailsModel user = ListPaymentDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //list attachment details
  Future<Map<String, dynamic>> listattachmentdetails(
      String userId,
      String clinicId,
      String patientId,
      String fileId,
      ) async {
    var result;

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/patients_details?clinic_id=$clinicId&user_id=$userId&ab=attachment&patient_id=$patientId&file_id=$fileId";
    final response = await http.get(Uri.parse(url),
        headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      ListAttachmentDetailsModel user = ListAttachmentDetailsModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }

  //cancel appointment
  Future<Map<String, dynamic>> cancelappointment(
      String userId,
      String clinicId,
      String patientId,
      String appointmentId,

      ) async {
    var result;

    final Map<String, dynamic> cancelappointmentdata = {
      "userId": userId,
      "clinicId": clinicId,
      "patientId": patientId,
      "appointmentId": appointmentId,
    };

    print(cancelappointmentdata.toString());

    var token =
        "ZG9jdG9zbWFydGFkbWluOiQyeSQxMiQ5WmE3VXROT2xqUlVXVm1WcnE4eXYuWnB1ekVoSzZ5ekkuZ2RLUkN4dzJFdFVmdnh5U1YzUw==";
    String basicAuth = 'Basic ' + token;
    print(basicAuth);
    final url =
        "https://app.doctosmart.com/api/delete_record?clinic_id=$clinicId&user_id=$userId&tab=appointment&patient_id=$patientId&appointment_id=$appointmentId";
    final response = await http.post(Uri.parse(url),
        body: cancelappointmentdata.toString(), headers: {'Authorization': 'Basic $token'});

    print(response.statusCode);
    if (response.statusCode == 200) {
      print("inside 200");
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      var userData = responseData;

      CancelAppointmentModel user = CancelAppointmentModel.fromJson(userData);

      result = {'status': true, 'message': 'Successful', 'user': user};
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }
    return result;
  }





















}