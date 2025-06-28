class NotificationModel {
  bool? success;
  List<DataNotifier>? data;

  NotificationModel({this.success, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <DataNotifier>[];
      json['data'].forEach((v) {
        data!.add(new DataNotifier.fromJson(v));
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

class DataNotifier {
  String? aNNOUNCEMENTHISTOID;
  String? aNNOUNCEMENTHISTORYID;
  String? rECEIVERID;
  String? rECEIVERTYPE;
  String? aNNOUNCEDATE;
  String? aNNOUNCEMENTID;
  String? aPIUSERTYPECODE;
  String? aNNOUNCEMENTBODY;
  String? aNNOUNCEMENTTITLE;
  String? aNNOUNCESENTDATE;
  String? iSREAD;
  String? pAGECODE;
  String? oBJECTID;
  String? eXTRASTUDENTID;
  String? eXTRACLASSID;
  String? mODULECODE;
  String? aNNOUNCETIMESTAMP;
  String? aNNOUNCEMENTLOGOPATH;
  String? wITHROUTE;

  DataNotifier(
      {this.aNNOUNCEMENTHISTOID,
        this.aNNOUNCEMENTHISTORYID,
        this.rECEIVERID,
        this.rECEIVERTYPE,
        this.aNNOUNCEDATE,
        this.aNNOUNCEMENTID,
        this.aPIUSERTYPECODE,
        this.aNNOUNCEMENTBODY,
        this.aNNOUNCEMENTTITLE,
        this.aNNOUNCESENTDATE,
        this.iSREAD,
        this.pAGECODE,
        this.oBJECTID,
        this.eXTRASTUDENTID,
        this.eXTRACLASSID,
        this.mODULECODE,
        this.aNNOUNCETIMESTAMP,
        this.aNNOUNCEMENTLOGOPATH,
        this.wITHROUTE});

  DataNotifier.fromJson(Map<String, dynamic> json) {
    aNNOUNCEMENTHISTOID = json['ANNOUNCEMENT_HIS_TO_ID'];
    aNNOUNCEMENTHISTORYID = json['ANNOUNCEMENT_HISTORY_ID'];
    rECEIVERID = json['RECEIVER_ID'];
    rECEIVERTYPE = json['RECEIVER_TYPE'];
    aNNOUNCEDATE = json['ANNOUNCE_DATE'];
    aNNOUNCEMENTID = json['ANNOUNCEMENT_ID'];
    aPIUSERTYPECODE = json['API_USER_TYPE_CODE'];
    aNNOUNCEMENTBODY = json['ANNOUNCEMENT_BODY'];
    aNNOUNCEMENTTITLE = json['ANNOUNCEMENT_TITLE'];
    aNNOUNCESENTDATE = json['ANNOUNCE_SENT_DATE'];
    iSREAD = json['IS_READ'];
    pAGECODE = json['PAGE_CODE'];
    oBJECTID = json['OBJECT_ID'];
    eXTRASTUDENTID = json['EXTRA_STUDENT_ID'];
    eXTRACLASSID = json['EXTRA_CLASS_ID'];
    mODULECODE = json['MODULE_CODE'];
    aNNOUNCETIMESTAMP = json['ANNOUNCE_TIMESTAMP'];
    aNNOUNCEMENTLOGOPATH = json['ANNOUNCEMENT_LOGO_PATH'];
    wITHROUTE = json['WITH_ROUTE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ANNOUNCEMENT_HIS_TO_ID'] = this.aNNOUNCEMENTHISTOID;
    data['ANNOUNCEMENT_HISTORY_ID'] = this.aNNOUNCEMENTHISTORYID;
    data['RECEIVER_ID'] = this.rECEIVERID;
    data['RECEIVER_TYPE'] = this.rECEIVERTYPE;
    data['ANNOUNCE_DATE'] = this.aNNOUNCEDATE;
    data['ANNOUNCEMENT_ID'] = this.aNNOUNCEMENTID;
    data['API_USER_TYPE_CODE'] = this.aPIUSERTYPECODE;
    data['ANNOUNCEMENT_BODY'] = this.aNNOUNCEMENTBODY;
    data['ANNOUNCEMENT_TITLE'] = this.aNNOUNCEMENTTITLE;
    data['ANNOUNCE_SENT_DATE'] = this.aNNOUNCESENTDATE;
    data['IS_READ'] = this.iSREAD;
    data['PAGE_CODE'] = this.pAGECODE;
    data['OBJECT_ID'] = this.oBJECTID;
    data['EXTRA_STUDENT_ID'] = this.eXTRASTUDENTID;
    data['EXTRA_CLASS_ID'] = this.eXTRACLASSID;
    data['MODULE_CODE'] = this.mODULECODE;
    data['ANNOUNCE_TIMESTAMP'] = this.aNNOUNCETIMESTAMP;
    data['ANNOUNCEMENT_LOGO_PATH'] = this.aNNOUNCEMENTLOGOPATH;
    data['WITH_ROUTE'] = this.wITHROUTE;
    return data;
  }
}