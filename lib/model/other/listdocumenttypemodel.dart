class ListDocumentTypeModel {
  List<ListDocumentType>? result;
  String? message;

  ListDocumentTypeModel({this.result, this.message});

  ListDocumentTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ListDocumentType>[];
      json['result'].forEach((v) {
        result!.add(ListDocumentType.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class ListDocumentType {
  String? documentId;
  String? documentName;

  ListDocumentType({this.documentId, this.documentName});

  ListDocumentType.fromJson(Map<String, dynamic> json) {
    documentId = json['document_id'];
    documentName = json['document_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['document_id'] = this.documentId;
    data['document_name'] = this.documentName;
    return data;
  }
}
