class DeletePatientModel {
  DeletePatient? result;
  String? message;

  DeletePatientModel({this.result, this.message});

  DeletePatientModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new DeletePatient.fromJson(json['result']) : null;
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

class DeletePatient {
  String? patientId;
  String? registrationId;
  String? patientName;

  DeletePatient({this.patientId, this.registrationId, this.patientName});

  DeletePatient.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    registrationId = json['registration_id'];
    patientName = json['patient_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_id'] = this.patientId;
    data['registration_id'] = this.registrationId;
    data['patient_name'] = this.patientName;
    return data;
  }
}
