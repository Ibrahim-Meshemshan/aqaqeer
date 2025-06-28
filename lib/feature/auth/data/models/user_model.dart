class UserModel {
  bool? success;
  String? error;
  String? errorCode;
  Data? data;

  UserModel({this.success, this.error, this.errorCode, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    errorCode = json['errorCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    data['errorCode'] = errorCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? uSERID;
  String? oBJECTID;
  String? uSERTYPECODE;
  String? uSERNAME;
  String? eMAIL;
  String? mOBILE;
  String? tOKEN;
  String? rEMEMBERTOKEN;
  String? eMAILVERIFIED;
  String? mOBILEVERIFIED;
  String? vERIFYEMAIL;
  String? vERIFYMOBILE;
  String? lASTOSTYPE;
  String? lOCALLANG;
  EXTRA? eXTRA;

  Data(
      {this.uSERID,
        this.oBJECTID,
        this.uSERTYPECODE,
        this.uSERNAME,
        this.eMAIL,
        this.mOBILE,
        this.tOKEN,
        this.rEMEMBERTOKEN,
        this.eMAILVERIFIED,
        this.mOBILEVERIFIED,
        this.vERIFYEMAIL,
        this.vERIFYMOBILE,
        this.lASTOSTYPE,
        this.lOCALLANG,
        this.eXTRA});

  Data.fromJson(Map<String, dynamic> json) {
    uSERID = json['USER_ID'];
    oBJECTID = json['OBJECT_ID'];
    uSERTYPECODE = json['USER_TYPE_CODE'];
    uSERNAME = json['USERNAME'];
    eMAIL = json['EMAIL'];
    mOBILE = json['MOBILE'];
    tOKEN = json['TOKEN'];
    rEMEMBERTOKEN = json['REMEMBER_TOKEN'];
    eMAILVERIFIED = json['EMAIL_VERIFIED'];
    mOBILEVERIFIED = json['MOBILE_VERIFIED'];
    vERIFYEMAIL = json['VERIFY_EMAIL'];
    vERIFYMOBILE = json['VERIFY_MOBILE'];
    lASTOSTYPE = json['LAST_OS_TYPE'];
    lOCALLANG = json['LOCAL_LANG'];
    eXTRA = json['EXTRA'] != null ? EXTRA.fromJson(json['EXTRA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['USER_ID'] = uSERID;
    data['OBJECT_ID'] = oBJECTID;
    data['USER_TYPE_CODE'] = uSERTYPECODE;
    data['USERNAME'] = uSERNAME;
    data['EMAIL'] = eMAIL;
    data['MOBILE'] = mOBILE;
    data['TOKEN'] = tOKEN;
    data['REMEMBER_TOKEN'] = rEMEMBERTOKEN;
    data['EMAIL_VERIFIED'] = eMAILVERIFIED;
    data['MOBILE_VERIFIED'] = mOBILEVERIFIED;
    data['VERIFY_EMAIL'] = vERIFYEMAIL;
    data['VERIFY_MOBILE'] = vERIFYMOBILE;
    data['LAST_OS_TYPE'] = lASTOSTYPE;
    data['LOCAL_LANG'] = lOCALLANG;
    if (eXTRA != null) {
      data['EXTRA'] = eXTRA!.toJson();
    }
    return data;
  }
}

class EXTRA {
  String? eMPLOYEEID;
  String? fULLNAME;
  String? jOBTITLENAME;
  String? cORPORATENODENAME;
  String? pREFEREDLANG;
  bool? iSEMPLOYEE;
  String? eMPLOYEEPICTURE;

  EXTRA(
      {this.eMPLOYEEID,
        this.fULLNAME,
        this.jOBTITLENAME,
        this.cORPORATENODENAME,
        this.pREFEREDLANG,
        this.iSEMPLOYEE,
        this.eMPLOYEEPICTURE});

  EXTRA.fromJson(Map<String, dynamic> json) {
    eMPLOYEEID = json['EMPLOYEE_ID'];
    fULLNAME = json['FULL_NAME'];
    jOBTITLENAME = json['JOB_TITLE_NAME'];
    cORPORATENODENAME = json['CORPORATE_NODE_NAME'];
    pREFEREDLANG = json['PREFERED_LANG'];
    iSEMPLOYEE = json['IS_EMPLOYEE'];
    eMPLOYEEPICTURE = json['EMPLOYEE_PICTURE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EMPLOYEE_ID'] = eMPLOYEEID;
    data['FULL_NAME'] = fULLNAME;
    data['JOB_TITLE_NAME'] = jOBTITLENAME;
    data['CORPORATE_NODE_NAME'] = cORPORATENODENAME;
    data['PREFERED_LANG'] = pREFEREDLANG;
    data['IS_EMPLOYEE'] = iSEMPLOYEE;
    data['EMPLOYEE_PICTURE'] = eMPLOYEEPICTURE;
    return data;
  }
}