class ListClinicalNoteModel {
  List<dynamic>? result;
  String? message;
  int? totalCount;

  ListClinicalNoteModel({this.result, this.message, this.totalCount});

  ListClinicalNoteModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <dynamic>[];
      json['result'].forEach((v) {
        result!.add(v);
      });
    }
    message = json['message'];
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result;
    }
    data['message'] = this.message;
    data['total_count'] = this.totalCount;
    return data;
  }
}
