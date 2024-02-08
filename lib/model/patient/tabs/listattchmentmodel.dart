class ListAttachmentModel {
  ListAttachment? result;
  String? message;
  int? totalCount;

  ListAttachmentModel({this.result, this.message, this.totalCount});

  ListAttachmentModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new ListAttachment.fromJson(json['result']) : null;
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

class ListAttachment {
  String? id;
  String? patientId;
  String? documentName;
  String? attachmentDate;
  String? attachmentTime;
  String? doctorName;
  String? attachments;

  ListAttachment(
      {this.id,
        this.patientId,
        this.documentName,
        this.attachmentDate,
        this.attachmentTime,
        this.doctorName,
        this.attachments});

  ListAttachment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    documentName = json['document_name'];
    attachmentDate = json['attachment_date'];
    attachmentTime = json['attachment_time'];
    doctorName = json['doctor_name'];
    attachments = json['attachments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['document_name'] = this.documentName;
    data['attachment_date'] = this.attachmentDate;
    data['attachment_time'] = this.attachmentTime;
    data['doctor_name'] = this.doctorName;
    data['attachments'] = this.attachments;
    return data;
  }
}
