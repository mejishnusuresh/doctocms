class CancelAppointmentModel {
  CancelAppointment? result;
  String? message;

  CancelAppointmentModel({this.result, this.message});

  CancelAppointmentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new CancelAppointment.fromJson(json['result']) : null;
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

class CancelAppointment {
  String? appointmentId;
  String? patientId;
  String? patientName;
  String? userId;
  String? clinicId;

  CancelAppointment(
      {this.appointmentId,
        this.patientId,
        this.patientName,
        this.userId,
        this.clinicId});

  CancelAppointment.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    userId = json['user_id'];
    clinicId = json['clinic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointmentId;
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['user_id'] = this.userId;
    data['clinic_id'] = this.clinicId;
    return data;
  }
}