//
// class patientmodel {
//   List<patient>? result;
//   String? message;
//   int? totalCount;
//
//   patientmodel({this.result, this.message, this.totalCount});
//
//   patientmodel.fromJson(Map<String, dynamic> json) {
//     if (json['result'] != null) {
//       result = <patient>[];
//       json['result'].forEach((v) {
//         result!.add(patient.fromJson(v));
//       });
//     }
//     message = json['message'];
//     totalCount = json['total_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.result != null) {
//       data['result'] = this.result!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     data['total_count'] = this.totalCount;
//     return data;
//   }
// }
//
// class patient {
//   String? id;
//   String? registrationId;
//   String? patientName;
//   String? gender;
//   String? age;
//   String? address;
//   String? mobileNo;
//   String? profilePicture;
//   String? dateOfBirth;
//   String? email;
//   String? clinicId;
//   String? userId;
//
//   patient({
//     this.id,
//     this.registrationId,
//     this.patientName,
//     this.gender,
//     this.age,
//     this.address,
//     this.mobileNo,
//     this.profilePicture,
//     this.dateOfBirth,
//     this.email,
//     this.clinicId,
//     this.userId,
//   });
//
//   patient.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     registrationId = json['registration_id'];
//     patientName = json['patient_name'];
//     gender = json['gender'];
//     age = json['age'];
//     address = json['address'];
//     mobileNo = json['mobile_no'];
//     profilePicture = json['profile_picture'];
//     dateOfBirth = json['date_of_birth'];
//     email = json['email'];
//     clinicId = json['clinic_id'];
//     userId = json['user_id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['registration_id'] = this.registrationId;
//     data['patient_name'] = this.patientName;
//     data['gender'] = this.gender;
//     data['age'] = this.age;
//     data['address'] = this.address;
//     data['mobile_no'] = this.mobileNo;
//     data['profile_picture'] = this.profilePicture;
//     data['date_of_birth'] = this.dateOfBirth;
//     data['email'] = this.email;
//     data['clinic_id'] = this.clinicId;
//     data['user_id'] = this.userId;
//     return data;
//   }
// }