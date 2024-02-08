class ListDashboardModel {
  Result? result;
  String? message;
  String? clinicName;
  String? doctorName;
  String? profilePicture;
  int? isActive;

  ListDashboardModel({
    this.result,
    this.message,
    this.clinicName,
    this.doctorName,
    this.profilePicture,
    this.isActive,
  });

  ListDashboardModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    clinicName = json['clinic_name'];
    doctorName = json['doctor_name'];
    profilePicture = json['profile_picture'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['clinic_name'] = clinicName;
    data['doctor_name'] = doctorName;
    data['profile_picture'] = profilePicture;
    data['is_active'] = isActive;
    return data;
  }
}

class Result {
  int? sunday;
  int? monday;
  int? tuesday;
  int? wednesday;
  int? thursday;
  int? friday;
  int? saturday;

  Result({
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
  });

  Result.fromJson(Map<String, dynamic> json) {
    sunday = json['sunday'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sunday'] = sunday;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    return data;
  }
}
