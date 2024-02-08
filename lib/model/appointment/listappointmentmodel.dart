class ListAppointmentModel {
  List<ListAppointment>? result;
  String? message;
  int? totalCount;

  ListAppointmentModel({this.result, this.message, this.totalCount});

  ListAppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListAppointment>[];
      json['result'].forEach((v) {
        result!.add(new ListAppointment.fromJson(v));
      });
    }
    message = json['message'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class ListAppointment {
  String? patientName;
  String? appointmentId;
  String? patientId;
  String? clinicId;
  String? userId;
  String? eventName;
  String? description;
  String? duration;
  String? appointmentDate;
  String? appointmentTime;
  String? doctorName;
  String? treatment;
  String? status;

  ListAppointment(
      {this.patientName,
        this.appointmentId,
        this.patientId,
        this.clinicId,
        this.userId,
        this.eventName,
        this.description,
        this.duration,
        this.appointmentDate,
        this.appointmentTime,
        this.doctorName,
        this.treatment,
        this.status});

  ListAppointment.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    appointmentId = json['appointment_id'];
    patientId = json['patient_id'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    eventName = json['event_name'];
    description = json['description'];
    duration = json['duration'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    doctorName = json['doctor_name'];
    treatment = json['treatment'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['appointment_id'] = this.appointmentId;
    data['patient_id'] = this.patientId;
    data['clinic_id'] = this.clinicId;
    data['user_id'] = this.userId;
    data['event_name'] = this.eventName;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['appointment_date'] = this.appointmentDate;
    data['appointment_time'] = this.appointmentTime;
    data['doctor_name'] = this.doctorName;
    data['treatment'] = this.treatment;
    data['status'] = this.status;
    return data;
  }
}



