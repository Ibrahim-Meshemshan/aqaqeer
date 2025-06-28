class NotificationTypeModel {
  bool? success;
  List<Data>? data;

  NotificationTypeModel({this.success, this.data});

  NotificationTypeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? aNNOUNCEMENTTYPEID;
  String? aNNOUNCEMENTTYPECODE;
  String? aNNOUNCEMENTTYPE;
  String? aNNOUNCEMENTTYPEPL;
  String? aNNOUNCEMENTTYPESL;
  String? aNNOUNCEMENTTYPEORDER;

  Data(
      {this.aNNOUNCEMENTTYPEID,
        this.aNNOUNCEMENTTYPECODE,
        this.aNNOUNCEMENTTYPE,
        this.aNNOUNCEMENTTYPEPL,
        this.aNNOUNCEMENTTYPESL,
        this.aNNOUNCEMENTTYPEORDER});

  Data.fromJson(Map<String, dynamic> json) {
    aNNOUNCEMENTTYPEID = json['ANNOUNCEMENT_TYPE_ID'];
    aNNOUNCEMENTTYPECODE = json['ANNOUNCEMENT_TYPE_CODE'];
    aNNOUNCEMENTTYPE = json['ANNOUNCEMENT_TYPE'];
    aNNOUNCEMENTTYPEPL = json['ANNOUNCEMENT_TYPE_PL'];
    aNNOUNCEMENTTYPESL = json['ANNOUNCEMENT_TYPE_SL'];
    aNNOUNCEMENTTYPEORDER = json['ANNOUNCEMENT_TYPE_ORDER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ANNOUNCEMENT_TYPE_ID'] = this.aNNOUNCEMENTTYPEID;
    data['ANNOUNCEMENT_TYPE_CODE'] = this.aNNOUNCEMENTTYPECODE;
    data['ANNOUNCEMENT_TYPE'] = this.aNNOUNCEMENTTYPE;
    data['ANNOUNCEMENT_TYPE_PL'] = this.aNNOUNCEMENTTYPEPL;
    data['ANNOUNCEMENT_TYPE_SL'] = this.aNNOUNCEMENTTYPESL;
    data['ANNOUNCEMENT_TYPE_ORDER'] = this.aNNOUNCEMENTTYPEORDER;
    return data;
  }
}