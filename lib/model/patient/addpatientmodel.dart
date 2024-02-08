import 'dart:io';

class AddPatientModel {
  AddPatient? result;
  String? message;

  AddPatientModel({this.result, this.message});

  AddPatientModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new AddPatient.fromJson(json['result']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class AddPatient {
  String? patientName;
  String? registrationId;
  String? dateOfBirth;
  String? email;
  String? mobileNo;
  String? address;
  String? gender;
  String? age;
  String? clinicId;
  String? userId;
  File? profilePicture;

  AddPatient(
      {this.patientName,
        this.registrationId,
        this.dateOfBirth,
        this.email,
        this.mobileNo,
        this.address,
        this.gender,
        this.age,
        this.profilePicture,
        this.clinicId,
        this.userId});

  AddPatient.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    registrationId = json['registration_id'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    mobileNo = json['mobile_no'];
    address = json['address'];
    gender = json['gender'];
    age = json['age'];
    profilePicture = json['profile_picture'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['registration_id'] = this.registrationId;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['mobile_no'] = this.mobileNo;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['profile_picture'] = this.profilePicture;
    data['clinic_id'] = this.clinicId;
    data['user_id'] = this.userId;
    return data;
  }
}