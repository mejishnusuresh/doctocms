class ListPrescriptionMasterModel {
  List<AddPrescriptionMaster>? result;
  String? message;

  ListPrescriptionMasterModel({this.result, this.message});

  ListPrescriptionMasterModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <AddPrescriptionMaster>[];
      json['result'].forEach((v) {
        result!.add(new AddPrescriptionMaster.fromJson(v));
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

class AddPrescriptionMaster {
  String? drugName;
  String? genericName;
  String? dosage;
  String? frequency;

  AddPrescriptionMaster({this.drugName, this.genericName, this.dosage, this.frequency});

  AddPrescriptionMaster.fromJson(Map<String, dynamic> json) {
    drugName = json['drug_name'];
    genericName = json['generic_name'];
    dosage = json['dosage'];
    frequency = json['frequency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['drug_name'] = this.drugName;
    data['generic_name'] = this.genericName;
    data['dosage'] = this.dosage;
    data['frequency'] = this.frequency;
    return data;
  }
}
