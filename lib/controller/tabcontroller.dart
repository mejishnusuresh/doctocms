import 'package:get/get.dart';
import 'package:project1/service/webservice.dart';

class tabController extends GetxController {
  static tabController get to => Get.find();

  ///  APPOINTMENT ///
  //list appointment

  Future<Map<String, dynamic>> listappointment(
      String patientId,
      String clinicId,
      String userId,
      String startDate
      ) async {
    final results = await Webservice().listappointment(patientId, clinicId, userId, startDate);

    return results;
  }

  //add appointment
  Future<Map<String, dynamic>> addappointment(
      String patientId,
      String clinicId,
      String userId,
      String startDate,
      String patientName,
      String purposeVisit,
      ) async {
    final results = await Webservice().addappointment(patientId, clinicId, userId, startDate,patientName,purposeVisit);

    return results;
  }

  //list appointment details
  Future<Map<String, dynamic>> listappointmentdetails(
      String patientId,
      String clinicId,
      String userId,
      String startDate
      ) async {
    final results = await Webservice().listappointmentdetails(patientId, clinicId, userId, startDate);

    return results;
  }

  //cancel appointment
  Future<Map<String, dynamic>> cancelappointment(
      String patientId,
      String clinicId,
      String userId,
      String appointmentId,
      ) async {
    final results = await Webservice().cancelappointment(patientId, clinicId, userId,appointmentId);

    return results;
  }

  ///  CLINICAL NOTE  ///

  //list clinical note
  Future<Map<String, dynamic>> listclinicalnote(
      String patientId,
      String clinicId,
      String userId,
      ) async {
    final results = await Webservice().listclinicalnote(patientId, clinicId, userId);

    return results;
  }

  //add clinical note
  Future<Map<String, dynamic>> addclinicalnote(
      String patientId,
      String clinicId,
      String userId,
      String? doctorId,
      // String complaints,
      // String observation,
      // String investigation,
      // String diagnosis,
      ) async {
    final results = await Webservice().addclinicalnote(patientId, clinicId, userId,doctorId);//,complaints,observation,investigation,diagnosis);

    return results;
  }

  //list clinical note details
  Future<Map<String, dynamic>> listclinicalnotedetails(
      String patientId,
      String clinicId,
      String userId,
      String notesId
      ) async {
    final results = await Webservice().listclinicalnotedetails(patientId, clinicId, userId,notesId);

    return results;
  }



  ///  TREATMENT  ///

  //add treatment
  Future<Map<String, dynamic>> addtreatment(
      String patientId,
      String clinicId,
      String userId,
      String doctorId,
      ) async {
    final results = await Webservice().addtreatment(patientId, clinicId, userId,doctorId);

    return results;
  }

  //list treatment
  Future<Map<String, dynamic>> listtreatment(
      String patientId,
      String clinicId,
      String userId,
      ) async {
    final results = await Webservice().listtreatment(patientId, clinicId, userId);

    return results;
  }

  //list treatment details
  Future<Map<String, dynamic>> listtreatmentdetails(
      String patientId,
      String clinicId,
      String userId,
      String emrId,
      ) async {
    final results = await Webservice().listtreatmentdetails(patientId, clinicId, userId,emrId);

    return results;
  }



  ///  PRESCRIPTION  ///

  //add prescription
  Future<Map<String, dynamic>> addprescription(
      String patientId,
      String clinicId,
      String doctorId,
      String userId,
      // String totalAmount,
      // String drugs,
      // String drugName,
      // String duration,
      // String dosage,
      // String foodDuration,
      // String frequency,
      ) async {
    final results = await Webservice().addprescription(patientId, clinicId, userId,doctorId);

    return results;
  }

  //list prescription
  Future<Map<String, dynamic>> listprescription(
      String patientId,
      String clinicId,
      String userId,

      ) async {
    final results = await Webservice().listprescription(patientId, clinicId, userId);

    return results;
  }

  //list prescription details
  Future<Map<String, dynamic>> listprescriptiondetails(
      String patientId,
      String clinicId,
      String userId,
      String drugId

      ) async {
    final results = await Webservice().listprescriptiondetails(patientId, clinicId, userId,drugId);

    return results;
  }



  ///  PAYMENT  ///

  //list pending invoice
  Future<Map<String, dynamic>> listpendinginvoice(
      String patientId,
      String clinicId,
      String userId,
      ) async {
    final results = await Webservice().listpendinginvoice(patientId, clinicId, userId);

    return results;
  }

  //list payment
  Future<Map<String, dynamic>> listpayment(
      String patientId,
      String clinicId,
      String userId,
      ) async {
    final results = await Webservice().listpayment(patientId, clinicId, userId);

    return results;
  }

  //list payment details
  Future<Map<String, dynamic>> listpaymentdetails(
      String patientId,
      String paymentId,
      String clinicId,
      String userId,
      ) async {
    final results = await Webservice().listpaymentdetails(patientId, clinicId, userId,paymentId);

    return results;
  }



  ///  EMR MASTER  ///

  //list emr master
  Future<Map<String, dynamic>> listemrmaster(
      String clinicId,
      String userId,
      String searchIn,
      String notesType,
      ) async {
    final results = await Webservice().listemrmaster(clinicId, userId,searchIn,notesType);

    return results;
  }



  ///  ATTACHMENTS   ///

  //add attachment
  Future<Map<String, dynamic>> addattachment(
      String userId,
      String clinicId,
      String patientId,
      // String xinFile,
      // String documentId,
      ) async {
    final results = await Webservice().addattachment(clinicId, userId,patientId);

    return results;
  }

    //list attachment
    Future<Map<String, dynamic>> listattachment(
        String userId,
        String clinicId,
        String patientId,
        ) async {
      final results = await Webservice().listattachment(clinicId, userId,patientId);

      return results;
    }

    //list attachment detils
    Future<Map<String, dynamic>> listattachmentdetils(
        String userId,
        String clinicId,
        String patientId,
        String fileId,
        ) async {
      final results = await Webservice().listattachmentdetails(clinicId, userId,patientId,fileId);

      return results;
  }



  ///  PRESCRIPTION MASTER  ///

  //list prescription master
  Future<Map<String, dynamic>> listprescriptionmaster(
      String userId,
      String clinicId,
      String searchIn,
      ) async {
    final results = await Webservice().listprescriptionmaster(clinicId, userId,searchIn);

    return results;
  }



  ///  DOCUMENT TYPE  ///

  //list document type
  Future<Map<String, dynamic>> listdocumenttype(
      String userId,
      String clinicId,
      ) async {
    final results = await Webservice().listdocumenttype(clinicId, userId);

    return results;
  }

  void changeTab(String tabIdentifier) {
    int tabIndex = 2;
  }













}