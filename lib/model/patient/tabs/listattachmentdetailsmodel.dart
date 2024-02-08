class ListAttachmentDetailsModel {
  ListAttachmentDetails? result;
  String? message;
  int? totalCount;

  ListAttachmentDetailsModel({this.result, this.message, this.totalCount});

  ListAttachmentDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new ListAttachmentDetails.fromJson(json['result']) : null;
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

class ListAttachmentDetails {
  String? id;
  String? documentName;
  String? attachmentDate;
  String? attachmentTime;
  String? doctorName;
  String? attachments;

  ListAttachmentDetails(
      {this.id,
        this.documentName,
        this.attachmentDate,
        this.attachmentTime,
        this.doctorName,
        this.attachments});

  ListAttachmentDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    documentName = json['document_name'];
    attachmentDate = json['attachment_date'];
    attachmentTime = json['attachment_time'];
    doctorName = json['doctor_name'];
    attachments = json['attachments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['document_name'] = this.documentName;
    data['attachment_date'] = this.attachmentDate;
    data['attachment_time'] = this.attachmentTime;
    data['doctor_name'] = this.doctorName;
    data['attachments'] = this.attachments;
    return data;
  }
}