class AddPaymentModel {
  AddPayment? result;
  String? message;
  int? totalCount;

  AddPaymentModel({this.result, this.message, this.totalCount});

  AddPaymentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new AddPayment.fromJson(json['result']) : null;
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

class AddPayment {
  String? clinicId;
  String? userId;
  String? doctorId;
  String? recieptNo;
  String? patientId;
  String? paidAmount;
  String? paymentMode;
  String? description;
  String? createdAt;
  String? invoiceNo;
  String? invoiceId;

  AddPayment(
      {this.clinicId,
        this.userId,
        this.doctorId,
        this.recieptNo,
        this.patientId,
        this.paidAmount,
        this.paymentMode,
        this.description,
        this.createdAt,
        this.invoiceNo,
        this.invoiceId});

  AddPayment.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    recieptNo = json['reciept_no'];
    patientId = json['patient_id'];
    paidAmount = json['paid_amount'];
    paymentMode = json['payment_mode'];
    description = json['description'];
    createdAt = json['created_at'];
    invoiceNo = json['invoice_no'];
    invoiceId = json['invoice_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinic_id'] = this.clinicId;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['reciept_no'] = this.recieptNo;
    data['patient_id'] = this.patientId;
    data['paid_amount'] = this.paidAmount;
    data['payment_mode'] = this.paymentMode;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['invoice_no'] = this.invoiceNo;
    data['invoice_id'] = this.invoiceId;
    return data;
  }
}
