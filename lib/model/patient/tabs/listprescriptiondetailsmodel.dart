class ListPrescriptionDetailsModel {
  ListPrescriptionDetails? result;
  String? message;
  int? totalCount;

  ListPrescriptionDetailsModel({this.result, this.message, this.totalCount});

  ListPrescriptionDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new ListPrescriptionDetails.fromJson(json['result']) : null;
    message = json['message'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    data['total_count'] = this.totalCount;
    return data;
  }
}

class ListPrescriptionDetails {
  String? doctorName;
  String? drugDate;
  String? drugTime;
  String? patientName;
  List<DrugDetails>? drugDetails;

  ListPrescriptionDetails(
      {this.doctorName,
        this.drugDate,
        this.drugTime,
        this.patientName,
        this.drugDetails});

  ListPrescriptionDetails.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    drugDate = json['drug_date'];
    drugTime = json['drug_time'];
    patientName = json['patient_name'];
    if (json['drug_details'] != null) {
      drugDetails = <DrugDetails>[];
      json['drug_details'].forEach((v) {
        drugDetails!.add(new DrugDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_name'] = this.doctorName;
    data['drug_date'] = this.drugDate;
    data['drug_time'] = this.drugTime;
    data['patient_name'] = this.patientName;
    if (this.drugDetails != null) {
      data['drug_details'] = this.drugDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrugDetails {
  String? drugId;
  String? drugName;
  String? dosage;
  String? duration;
  String? frequency;
  String? type;

  DrugDetails(
      {this.drugId,
        this.drugName,
        this.dosage,
        this.duration,
        this.frequency,
        this.type});

  DrugDetails.fromJson(Map<String, dynamic> json) {
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    dosage = json['dosage'];
    duration = json['duration'];
    frequency = json['frequency'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['drug_id'] = this.drugId;
    data['drug_name'] = this.drugName;
    data['dosage'] = this.dosage;
    data['duration'] = this.duration;
    data['frequency'] = this.frequency;
    data['type'] = this.type;
    return data;
  }
}