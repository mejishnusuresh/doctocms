/////need edit


class AddPrescriptionModel {
  List<dynamic>? result;
  String? message;
  int? totalCount;

  AddPrescriptionModel({this.result, this.message, this.totalCount});

  AddPrescriptionModel.fromJson(Map<String, dynamic> json) {
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
    if (result != null) {
      data['result'] = result;
    }
    data['message'] = message;
    data['total_count'] = totalCount;
    return data;
  }
}




