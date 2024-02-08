class AddAppointmentModel {
  AddAppointment? result;
  String? message;

  AddAppointmentModel({this.result, this.message});

  AddAppointmentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new AddAppointment.fromJson(json['result']) : null;
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

class AddAppointment {
  String? appointmentId;
  String? startDate;
  String? patientId;
  String? patientName;
  String? purposeVisit;
  String? userId;
  String? doctorId;
  String? clinicId;

  AddAppointment(
      {this.appointmentId,
        this.startDate,
        this.patientId,
        this.patientName,
        this.purposeVisit,
        this.userId,
        this.doctorId,
        this.clinicId});

  AddAppointment.fromJson(Map<String, dynamic> json) {
    appointmentId = json['appointment_id'];
    startDate = json['start_date'];
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    purposeVisit = json['purpose_visit'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = this.appointmentId;
    data['start_date'] = this.startDate;
    data['patient_id'] = this.patientId;
    data['patient_name'] = this.patientName;
    data['purpose_visit'] = this.purposeVisit;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['clinic_id'] = this.clinicId;
    return data;
  }
}
