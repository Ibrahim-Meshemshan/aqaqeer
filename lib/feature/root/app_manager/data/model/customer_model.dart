class CustomerModel {
  Data? data;

  CustomerModel({this.data});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? mOBILEDETAILSID;
  String? cLIENTCODE;
  String? cLIENTNAMEEN;
  String? cLIENTNAMEAR;
  String? aPPCODE;
  String? aPPNAMEEN;
  String? aPPNAMEAR;
  String? aNDROIDMINIMUMVERSION;
  String? aNDROIDCURRENTVERSION;
  String? aCTIVATEANDROID;
  String? iOSMINIMUMVERSION;
  String? iOSCURRENTVERSION;
  String? aCTIVATEIOS;
  String? bASEURL;
  String? lOGOEXT;
  String? lOGO;
  String? cOUNTRYCODE;
  String? lOCALLANG;
  String? uSERNAMEHINT;
  String? pRIMARYCOLOR;
  String? sECONDARYCOLOR;
  String? aCTIVATEWEB;
  String? iSFORRASUSER;

  Data(
      {this.mOBILEDETAILSID,
        this.cLIENTCODE,
        this.cLIENTNAMEEN,
        this.cLIENTNAMEAR,
        this.aPPCODE,
        this.aPPNAMEEN,
        this.aPPNAMEAR,
        this.aNDROIDMINIMUMVERSION,
        this.aNDROIDCURRENTVERSION,
        this.aCTIVATEANDROID,
        this.iOSMINIMUMVERSION,
        this.iOSCURRENTVERSION,
        this.aCTIVATEIOS,
        this.bASEURL,
        this.lOGOEXT,
        this.lOGO,
        this.cOUNTRYCODE,
        this.lOCALLANG,
        this.uSERNAMEHINT,
        this.pRIMARYCOLOR,
        this.sECONDARYCOLOR,
        this.aCTIVATEWEB,
        this.iSFORRASUSER});

  Data.fromJson(Map<String, dynamic> json) {
    mOBILEDETAILSID = json['MOBILE_DETAILS_ID'];
    cLIENTCODE = json['CLIENT_CODE'];
    cLIENTNAMEEN = json['CLIENT_NAME_EN'];
    cLIENTNAMEAR = json['CLIENT_NAME_AR'];
    aPPCODE = json['APP_CODE'];
    aPPNAMEEN = json['APP_NAME_EN'];
    aPPNAMEAR = json['APP_NAME_AR'];
    aNDROIDMINIMUMVERSION = json['ANDROID_MINIMUM_VERSION'];
    aNDROIDCURRENTVERSION = json['ANDROID_CURRENT_VERSION'];
    aCTIVATEANDROID = json['ACTIVATE_ANDROID'];
    iOSMINIMUMVERSION = json['IOS_MINIMUM_VERSION'];
    iOSCURRENTVERSION = json['IOS_CURRENT_VERSION'];
    aCTIVATEIOS = json['ACTIVATE_IOS'];
    bASEURL = json['BASE_URL'];
    lOGOEXT = json['LOGO_EXT'];
    lOGO = json['LOGO'];
    cOUNTRYCODE = json['COUNTRY_CODE'];
    lOCALLANG = json['LOCAL_LANG'];
    uSERNAMEHINT = json['USERNAME_HINT'];
    pRIMARYCOLOR = json['PRIMARY_COLOR'];
    sECONDARYCOLOR = json['SECONDARY_COLOR'];
    aCTIVATEWEB = json['ACTIVATE_WEB'];
    iSFORRASUSER = json['IS_FOR_RAS_USER'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MOBILE_DETAILS_ID'] = mOBILEDETAILSID;
    data['CLIENT_CODE'] = cLIENTCODE;
    data['CLIENT_NAME_EN'] = cLIENTNAMEEN;
    data['CLIENT_NAME_AR'] = cLIENTNAMEAR;
    data['APP_CODE'] = aPPCODE;
    data['APP_NAME_EN'] = aPPNAMEEN;
    data['APP_NAME_AR'] = aPPNAMEAR;
    data['ANDROID_MINIMUM_VERSION'] = aNDROIDMINIMUMVERSION;
    data['ANDROID_CURRENT_VERSION'] = aNDROIDCURRENTVERSION;
    data['ACTIVATE_ANDROID'] = aCTIVATEANDROID;
    data['IOS_MINIMUM_VERSION'] = iOSMINIMUMVERSION;
    data['IOS_CURRENT_VERSION'] = iOSCURRENTVERSION;
    data['ACTIVATE_IOS'] = aCTIVATEIOS;
    data['BASE_URL'] = bASEURL;
    data['LOGO_EXT'] = lOGOEXT;
    data['LOGO'] = lOGO;
    data['COUNTRY_CODE'] = cOUNTRYCODE;
    data['LOCAL_LANG'] = lOCALLANG;
    data['USERNAME_HINT'] = uSERNAMEHINT;
    data['PRIMARY_COLOR'] = pRIMARYCOLOR;
    data['SECONDARY_COLOR'] = sECONDARYCOLOR;
    data['ACTIVATE_WEB'] = aCTIVATEWEB;
    data['IS_FOR_RAS_USER'] = iSFORRASUSER;
    return data;
  }
}
