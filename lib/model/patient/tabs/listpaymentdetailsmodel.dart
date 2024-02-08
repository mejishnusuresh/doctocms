class ListPaymentDetailsModel {
  ListPaymentDetails? result;
  String? message;
  int? totalCount;

  ListPaymentDetailsModel({this.result, this.message, this.totalCount});

  ListPaymentDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new ListPaymentDetails.fromJson(json['result']) : null;
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

class ListPaymentDetails {
  String? patientName;
  String? recieptNo;
  String? patientId;
  String? status;
  String? paidAmount;
  String? invoiceId;
  String? invoiceNo;
  String? paymentDate;
  String? paymentTime;
  String? doctorName;

  ListPaymentDetails(
      {this.patientName,
        this.recieptNo,
        this.patientId,
        this.status,
        this.paidAmount,
        this.invoiceId,
        this.invoiceNo,
        this.paymentDate,
        this.paymentTime,
        this.doctorName});

  ListPaymentDetails.fromJson(Map<String, dynamic> json) {
    patientName = json['patient_name'];
    recieptNo = json['reciept_no'];
    patientId = json['patient_id'];
    status = json['status'];
    paidAmount = json['paid_amount'];
    invoiceId = json['invoice_id'];
    invoiceNo = json['invoice_no'];
    paymentDate = json['payment_date'];
    paymentTime = json['payment_time'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['reciept_no'] = this.recieptNo;
    data['patient_id'] = this.patientId;
    data['status'] = this.status;
    data['paid_amount'] = this.paidAmount;
    data['invoice_id'] = this.invoiceId;
    data['invoice_no'] = this.invoiceNo;
    data['payment_date'] = this.paymentDate;
    data['payment_time'] = this.paymentTime;
    data['doctor_name'] = this.doctorName;
    return data;
  }
}
