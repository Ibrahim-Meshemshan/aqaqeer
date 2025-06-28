class NotificationStatueModel {
  bool? success;
  DataStatus? data;

  NotificationStatueModel({this.success, this.data});

  NotificationStatueModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ?  DataStatus.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataStatus {
  String? aNNOUNCEMENTREADCOUNT;
  String? aNNOUNCEMENTUNREADCOUNT;
  int? aNNOUNCEMENTCOUNT;

  DataStatus(
      {this.aNNOUNCEMENTREADCOUNT,
        this.aNNOUNCEMENTUNREADCOUNT,
        this.aNNOUNCEMENTCOUNT});

  DataStatus.fromJson(Map<String, dynamic> json) {
    aNNOUNCEMENTREADCOUNT = json['ANNOUNCEMENT_READ_COUNT'];
    aNNOUNCEMENTUNREADCOUNT = json['ANNOUNCEMENT_UNREAD_COUNT'];
    aNNOUNCEMENTCOUNT = json['ANNOUNCEMENT_COUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['ANNOUNCEMENT_READ_COUNT'] = aNNOUNCEMENTREADCOUNT;
    data['ANNOUNCEMENT_UNREAD_COUNT'] = aNNOUNCEMENTUNREADCOUNT;
    data['ANNOUNCEMENT_COUNT'] = aNNOUNCEMENTCOUNT;
    return data;
  }
}
