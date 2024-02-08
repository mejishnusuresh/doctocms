class AddTreatmentModel {
  String? tab;
  String? clinicId;
  String? patientId;
  String? userId;
  String? doctorId;
  String? totalAmount;
  List<AddTreatment>? treatment;

  AddTreatmentModel(
      {this.tab,
        this.clinicId,
        this.patientId,
        this.userId,
        this.doctorId,
        this.totalAmount,
        this.treatment});

  AddTreatmentModel.fromJson(Map<String, dynamic> json) {
    tab = json['tab'];
    clinicId = json['clinic_id'];
    patientId = json['patient_id'];
    userId = json['user_id'];
    doctorId = json['doctor_id'];
    totalAmount = json['total_amount'];
    if (json['treatment'] != null) {
      treatment = <AddTreatment>[];
      json['treatment'].forEach((v) {
        treatment!.add(new AddTreatment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tab'] = this.tab;
    data['clinic_id'] = this.clinicId;
    data['patient_id'] = this.patientId;
    data['user_id'] = this.userId;
    data['doctor_id'] = this.doctorId;
    data['total_amount'] = this.totalAmount;
    if (this.treatment != null) {
      data['treatment'] = this.treatment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddTreatment {
  String? treatmentName;
  String? itemUnit;
  String? itemPrice;
  String? itemTotalAmount;

  AddTreatment(
      {this.treatmentName,
        this.itemUnit,
        this.itemPrice,
        this.itemTotalAmount});

  AddTreatment.fromJson(Map<String, dynamic> json) {
    treatmentName = json['treatment_name'];
    itemUnit = json['item_unit'];
    itemPrice = json['item_price'];
    itemTotalAmount = json['item_total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['treatment_name'] = this.treatmentName;
    data['item_unit'] = this.itemUnit;
    data['item_price'] = this.itemPrice;
    data['item_total_amount'] = this.itemTotalAmount;
    return data;
  }
}
