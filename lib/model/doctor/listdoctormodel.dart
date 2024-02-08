class ListDoctorModel {
  List<ListDoctor>? result;
  String? message;

  ListDoctorModel({this.result, this.message});

  ListDoctorModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListDoctor>[];
      json['result'].forEach((v) {
        result!.add(new ListDoctor.fromJson(v));
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

class ListDoctor {
  String? userId;
  String? doctorName;
  String? username;
  String? email;
  String? createdAt;
  String? clinicId;
  String? userType;
  String? colorCode;
  String? staffType;

  ListDoctor(
      {this.userId,
        this.doctorName,
        this.username,
        this.email,
        this.createdAt,
        this.clinicId,
        this.userType,
        this.colorCode,
        this.staffType});

  ListDoctor.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    doctorName = json['doctor_name'];
    username = json['username'];
    email = json['email'];
    createdAt = json['created_at'];
    clinicId = json['clinic_id'];
    userType = json['user_type'];
    colorCode = json['color_code'];
    staffType = json['staff_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['doctor_name'] = this.doctorName;
    data['username'] = this.username;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['clinic_id'] = this.clinicId;
    data['user_type'] = this.userType;
    data['color_code'] = this.colorCode;
    data['staff_type'] = this.staffType;
    return data;
  }
}
