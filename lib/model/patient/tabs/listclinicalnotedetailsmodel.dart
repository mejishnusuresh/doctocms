class ListClinicalNoteDetailsModel {
  Result? result;
  String? message;
  int? totalCount;

  ListClinicalNoteDetailsModel({
    this.result,
    this.message,
    this.totalCount,
  });

  ListClinicalNoteDetailsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['total_count'] = totalCount;
    return data;
  }
}

class Result {
  String? doctorName;
  String? clinicalId;
  String? complaints;
  Null? observation;
  String? investigation;
  String? diagnosis;
  String? notesDate;
  String? notesTime;
  String? notes;

  Result({
    this.doctorName,
    this.clinicalId,
    this.complaints,
    this.observation,
    this.investigation,
    this.diagnosis,
    this.notesDate,
    this.notesTime,
    this.notes,
  });

  Result.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    clinicalId = json['clinical_id'];
    complaints = json['complaints'];
    observation = json['observation'];
    investigation = json['investigation'];
    diagnosis = json['diagnosis'];
    notesDate = json['notes_date'];
    notesTime = json['notes_time'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_name'] = doctorName;
    data['clinical_id'] = clinicalId;
    data['complaints'] = complaints;
    data['observation'] = observation;
    data['investigation'] = investigation;
    data['diagnosis'] = diagnosis;
    data['notes_date'] = notesDate;
    data['notes_time'] = notesTime;
    data['notes'] = notes;
    return data;
  }
}
