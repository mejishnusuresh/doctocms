class SigninModel {
  Signin? result;
  String? message;

  SigninModel({this.result, this.message});

  SigninModel.fromJson(Map<String, dynamic> json) {
    result = json['result']!= null ? new Signin.fromJson(json['result']) : null;
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

class Signin {
  String? clinicId;
  String? clinicName;
  String? clinicType;
  String? doctorName;
  String? email;
  String? password;
  String? confirmPassword;

  Signin({
    this.clinicId,
    this.clinicName,
    this.clinicType,
    this.doctorName,
    this.email,
    this.password,
    this.confirmPassword
  });

  Signin.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinic_name'];
    clinicType = json['clinic_type'];
    doctorName = json['doctor_name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirm_password'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic_name'] = this.clinicName;
    data['clinic_type'] = this.clinicType;
    data['doctor_name'] = this.doctorName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}