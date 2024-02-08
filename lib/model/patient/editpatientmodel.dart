class EditPatientModel {
  List<EditPatient>? result;
  String? message;

  EditPatientModel({this.result, this.message});

  EditPatientModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <EditPatient>[];
      json['result'].forEach((v) {
        result!.add(new EditPatient.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class EditPatient {
  String? id;
  String? registrationId;
  String? patientName;
  String? gender;
  String? age;
  String? address;
  String? profilePicture;
  String? mobileNo;
  String? dateOfBirth;
  String? email;
  String? clinicId;
  String? userId;

  EditPatient(
      {this.id,
        this.registrationId,
        this.patientName,
        this.gender,
        this.age,
        this.address,
        this.profilePicture,
        this.mobileNo,
        this.dateOfBirth,
        this.email,
        this.clinicId,
        this.userId});

  EditPatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationId = json['registration_id'];
    patientName = json['patient_name'];
    gender = json['gender'];
    age = json['age'];
    address = json['address'];
    profilePicture = json['profile_picture'];
    mobileNo = json['mobile_no'];
    dateOfBirth = json['date_of_birth'];
    email = json['email'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['registration_id'] = this.registrationId;
    data['patient_name'] = this.patientName;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['address'] = this.address;
    data['profile_picture'] = this.profilePicture;
    data['mobile_no'] = this.mobileNo;
    data['date_of_birth'] = this.dateOfBirth;
    data['email'] = this.email;
    data['clinic_id'] = this.clinicId;
    data['user_id'] = this.userId;
    return data;
  }
}
