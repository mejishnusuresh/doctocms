class ListPaymentModel {
  List<ListPayment>? result;
  String? message;
  int? totalCount;

  ListPaymentModel({this.result, this.message, this.totalCount});

  ListPaymentModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListPayment>[];
      json['result'].forEach((v) {
        result!.add(new ListPayment.fromJson(v));
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

class ListPayment {
  String? paymentId;
  String? recieptNo;
  String? patientId;
  String? paidAmount;
  String? invoiceId;
  String? invoiceNo;
  String? paymentDate;
  String? paymentTime;
  String? doctorName;

  ListPayment(
      {this.paymentId,
        this.recieptNo,
        this.patientId,
        this.paidAmount,
        this.invoiceId,
        this.invoiceNo,
        this.paymentDate,
        this.paymentTime,
        this.doctorName});

  ListPayment.fromJson(Map<String, dynamic> json) {
    paymentId = json['payment_id'];
    recieptNo = json['reciept_no'];
    patientId = json['patient_id'];
    paidAmount = json['paid_amount'];
    invoiceId = json['invoice_id'];
    invoiceNo = json['invoice_no'];
    paymentDate = json['payment_date'];
    paymentTime = json['payment_time'];
    doctorName = json['doctor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_id'] = this.paymentId;
    data['reciept_no'] = this.recieptNo;
    data['patient_id'] = this.patientId;
    data['paid_amount'] = this.paidAmount;
    data['invoice_id'] = this.invoiceId;
    data['invoice_no'] = this.invoiceNo;
    data['payment_date'] = this.paymentDate;
    data['payment_time'] = this.paymentTime;
    data['doctor_name'] = this.doctorName;
    return data;
  }
}