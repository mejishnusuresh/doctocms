class ListPendingInvoiceModel {
  List<ListPendingInvoice>? result;
  String? message;
  int? totalCount;

  ListPendingInvoiceModel({this.result, this.message, this.totalCount});

  ListPendingInvoiceModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListPendingInvoice>[];
      json['result'].forEach((v) {
        result!.add(new ListPendingInvoice.fromJson(v));
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

class ListPendingInvoice {
  String? invoiceNo;
  String? discountType;
  String? discountAmount;
  String? invoiceId;
  String? invoiceName;
  String? createdAt;
  String? paidAmount;
  String? totalAmount;

  ListPendingInvoice(
      {this.invoiceNo,
        this.discountType,
        this.discountAmount,
        this.invoiceId,
        this.invoiceName,
        this.createdAt,
        this.paidAmount,
        this.totalAmount});

  ListPendingInvoice.fromJson(Map<String, dynamic> json) {
    invoiceNo = json['invoice_no'];
    discountType = json['discount_type'];
    discountAmount = json['discount_amount'];
    invoiceId = json['invoice_id'];
    invoiceName = json['invoice_name'];
    createdAt = json['created_at'];
    paidAmount = json['paid_amount'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoice_no'] = this.invoiceNo;
    data['discount_type'] = this.discountType;
    data['discount_amount'] = this.discountAmount;
    data['invoice_id'] = this.invoiceId;
    data['invoice_name'] = this.invoiceName;
    data['created_at'] = this.createdAt;
    data['paid_amount'] = this.paidAmount;
    data['total_amount'] = this.totalAmount;
    return data;
  }
}