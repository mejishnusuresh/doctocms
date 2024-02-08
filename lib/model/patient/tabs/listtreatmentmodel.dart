class ListTreatmentModel {
  List<ListTreatment>? result;
  String? message;
  int? totalCount;

  ListTreatmentModel({this.result, this.message, this.totalCount});

  ListTreatmentModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListTreatment>[];
      json['result'].forEach((v) {
        result!.add(new ListTreatment.fromJson(v));
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

class ListTreatment {
  String? patientId;
  String? status;
  String? colorCode;
  String? invoiceId;
  String? invoiceNo;
  String? totalAmount;
  String? paidAmount;
  String? invoiceDate;
  String? invoiceTime;
  String? doctorName;

  ListTreatment(
      {this.patientId,
        this.status,
        this.colorCode,
        this.invoiceId,
        this.invoiceNo,
        this.totalAmount,
        this.paidAmount,
        this.invoiceDate,
        this.invoiceTime,
        this.doctorName});

  ListTreatment.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    status = json['status'];
    colorCode = json['color_code'];
    invoiceId = json['invoice_id'];
    invoiceNo = json['invoice_no'];
    totalAmount = json['total_amount'];
    paidAmount = json['paid_amount'];
    invoiceDate = json['invoice_date'];
    invoiceTime = json['invoice_time'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_id'] = this.patientId;
    data['status'] = this.status;
    data['color_code'] = this.colorCode;
    data['invoice_id'] = this.invoiceId;
    data['invoice_no'] = this.invoiceNo;
    data['total_amount'] = this.totalAmount;
    data['paid_amount'] = this.paidAmount;
    data['invoice_date'] = this.invoiceDate;
    data['invoice_time'] = this.invoiceTime;
    data['doctor_name'] = this.doctorName;
    return data;
  }
}
