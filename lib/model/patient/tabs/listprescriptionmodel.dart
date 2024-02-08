class ListPrescriptionModel {
  List<ListPrescription>? result;
  String? message;
  int? totalCount;

  ListPrescriptionModel({this.result, this.message, this.totalCount});

  ListPrescriptionModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListPrescription>[];
      json['result'].forEach((v) {
        result!.add(new ListPrescription.fromJson(v));
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

class ListPrescription {
  String? patientName;
  String? patientId;
  String? drugId;
  String? drugName;
  String? drugDate;
  String? drugTime;
  String? doctorName;

  ListPrescription(
      {this.patientName,
        this.patientId,
        this.drugId,
        this.drugName,
        this.drugDate,
        this.drugTime,
        this.doctorName});

  ListPrescription.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    patientId = json['patient_id'];
    drugId = json['drug_id'];
    drugName = json['drug_name'];
    drugDate = json['drug_date'];
    drugTime = json['drug_time'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['patient_id'] = this.patientId;
    data['drug_id'] = this.drugId;
    data['drug_name'] = this.drugName;
    data['drug_date'] = this.drugDate;
    data['drug_time'] = this.drugTime;
    data['doctor_name'] = this.doctorName;
    return data;
  }
}
