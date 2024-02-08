class LoginModel {
  Login? result;
  String? message;

  LoginModel({this.result, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new Login.fromJson(json['result']) : null;
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

class Login {
  String? clinicId;
  String? clinicName;
  String? mobileNo;
  String? userId;
  String? doctorName;
  String? email;
  String? baseDomainUrl;
  String? password;
  String? isDoctowhatsapp;

  Login(
      {this.clinicId,
        this.clinicName,
        this.mobileNo,
        this.userId,
        this.doctorName,
        this.email,
        this.baseDomainUrl,
        this.password,
        this.isDoctowhatsapp});

  Login.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    mobileNo = json['mobile_no'];
    userId = json['user_id'];
    doctorName = json['doctor_name'];
    email = json['email'];
    baseDomainUrl = json['base_domain_url'];
    password = json['password'];
    isDoctowhatsapp = json['is_doctowhatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic_id'] = this.clinicId;
    data['clinic_name'] = this.clinicName;
    data['mobile_no'] = this.mobileNo;
    data['user_id'] = this.userId;
    data['doctor_name'] = this.doctorName;
    data['email'] = this.email;
    data['base_domain_url'] = this.baseDomainUrl;
    data['password'] = this.password;
    data['is_doctowhatsapp'] = this.isDoctowhatsapp;
    return data;
  }
}