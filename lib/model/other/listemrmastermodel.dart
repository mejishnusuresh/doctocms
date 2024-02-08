class ListEmrMasterModel {
  List<EmrMaster>? result;
  String? message;

  ListEmrMasterModel({this.result, this.message});

  ListEmrMasterModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <EmrMaster>[];
      json['result'].forEach((v) {
        result!.add(new EmrMaster.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class EmrMaster {
  String? id;
  String? investigations;
  String? status;
  String? userId;
  String? clinicId;
  String? createdAt;
  Null? type;
  Null? testDescription;
  Null? investigationCode;

  EmrMaster(
      {this.id,
        this.investigations,
        this.status,
        this.userId,
        this.clinicId,
        this.createdAt,
        this.type,
        this.testDescription,
        this.investigationCode});

  EmrMaster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    investigations = json['investigations'];
    status = json['status'];
    userId = json['user_id'];
    clinicId = json['clinic_id'];
    createdAt = json['created_at'];
    type = json['type'];
    testDescription = json['test_description'];
    investigationCode = json['investigation_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['investigations'] = this.investigations;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['clinic_id'] = this.clinicId;
    data['created_at'] = this.createdAt;
    data['type'] = this.type;
    data['test_description'] = this.testDescription;
    data['investigation_code'] = this.investigationCode;
    return data;
  }
}
