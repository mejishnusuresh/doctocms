class AddAttachmentModel {
  AddAttachment? result;
  String? message;

  AddAttachmentModel({this.result, this.message});

  AddAttachmentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new AddAttachment.fromJson(json['result']) : null;
    message = json['message'];
  }
}

class AddAttachment {
  String? patientId;
  String? patientName;
  String? category;
  String? userId;
  String? doctorId;
  String? clinicId;

  AddAttachment(
      {
        this.patientId,
        this.patientName,
        this.category,
        this.userId,
        this.doctorId,
        this.clinicId});

  AddAttachment.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    category = json['category'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['purpose_visit'] = this.category;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['clinic_id'] = this.clinicId;
    return data;
  }
}
