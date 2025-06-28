class GetUserNotificationTypeModel {
  bool? success;
  List<DataNotificationType>? data;

  GetUserNotificationTypeModel({this.success, this.data});

  GetUserNotificationTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataNotificationType>[];
      json['data'].forEach((v) {
        data!.add(new DataNotificationType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataNotificationType {
  String? rECEIVERTYPEMETHODID;
  String? rECEIVERTYPE;
  String? rECEIVERID;
  String? aNNOUNCEMENTTYPEID;
  String? wEB;
  String? mOBILE;
  String? wTS;
  String? eMAIL;
  String? sMS;

  DataNotificationType(
      {this.rECEIVERTYPEMETHODID,
        this.rECEIVERTYPE,
        this.rECEIVERID,
        this.aNNOUNCEMENTTYPEID,
        this.wEB,
        this.mOBILE,
        this.wTS,
        this.eMAIL,
        this.sMS});

  DataNotificationType.fromJson(Map<String, dynamic> json) {
    rECEIVERTYPEMETHODID = json['RECEIVER_TYPE_METHOD_ID'];
    rECEIVERTYPE = json['RECEIVER_TYPE'];
    rECEIVERID = json['RECEIVER_ID'];
    aNNOUNCEMENTTYPEID = json['ANNOUNCEMENT_TYPE_ID'];
    wEB = json['WEB'];
    mOBILE = json['MOBILE'];
    wTS = json['WTS'];
    eMAIL = json['EMAIL'];
    sMS = json['SMS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RECEIVER_TYPE_METHOD_ID'] = this.rECEIVERTYPEMETHODID;
    data['RECEIVER_TYPE'] = this.rECEIVERTYPE;
    data['RECEIVER_ID'] = this.rECEIVERID;
    data['ANNOUNCEMENT_TYPE_ID'] = this.aNNOUNCEMENTTYPEID;
    data['WEB'] = this.wEB;
    data['MOBILE'] = this.mOBILE;
    data['WTS'] = this.wTS;
    data['EMAIL'] = this.eMAIL;
    data['SMS'] = this.sMS;
    return data;
  }
}