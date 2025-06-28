class AppInfoModel {
  Data? data;
  String? message;

  AppInfoModel({this.data, this.message});

  AppInfoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
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
  String? aPPABOUTEN;
  String? aPPABOUTAR;
  String? aPPPOLICYEN;
  String? aPPPOLICYAR;
  String? aBOUTAUTOMATAAR;
  String? aBOUTAUTOMATAEN;
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
  String? cURRENCYSAMPLE;
  String? cURRENCYAR;
  String? cURRENCYEN;
  String? cHATENABLE;
  String? cHATURL;
  String? cHATSOCKETURL;
  String? cHATWSKEY;
  String? cHATWSHOST;
  String? mAINTENANCE;
  String? mAINTENANCEMESSAGE;
  String? wEBURL;
  List<dynamic>? eXTRAATTRIBUTE;

  Data(
      {this.mOBILEDETAILSID,
        this.cLIENTCODE,
        this.cLIENTNAMEEN,
        this.cLIENTNAMEAR,
        this.aPPCODE,
        this.aPPNAMEEN,
        this.aPPNAMEAR,
        this.aPPABOUTEN,
        this.aPPABOUTAR,
        this.aPPPOLICYEN,
        this.aPPPOLICYAR,
        this.aBOUTAUTOMATAAR,
        this.aBOUTAUTOMATAEN,
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
        this.iSFORRASUSER,
        this.cURRENCYSAMPLE,
        this.cURRENCYAR,
        this.cURRENCYEN,
        this.cHATENABLE,
        this.cHATURL,
        this.cHATSOCKETURL,
        this.cHATWSKEY,
        this.cHATWSHOST,
        this.mAINTENANCE,
        this.mAINTENANCEMESSAGE,
        this.wEBURL,
        this.eXTRAATTRIBUTE});

  Data.fromJson(Map<String, dynamic> json) {
    mOBILEDETAILSID = json['MOBILE_DETAILS_ID'];
    cLIENTCODE = json['CLIENT_CODE'];
    cLIENTNAMEEN = json['CLIENT_NAME_EN'];
    cLIENTNAMEAR = json['CLIENT_NAME_AR'];
    aPPCODE = json['APP_CODE'];
    aPPNAMEEN = json['APP_NAME_EN'];
    aPPNAMEAR = json['APP_NAME_AR'];
    aPPABOUTEN = json['APP_ABOUT_EN'];
    aPPABOUTAR = json['APP_ABOUT_AR'];
    aPPPOLICYEN = json['APP_POLICY_EN'];
    aPPPOLICYAR = json['APP_POLICY_AR'];
    aBOUTAUTOMATAAR = json['ABOUT_AUTOMATA_AR'];
    aBOUTAUTOMATAEN = json['ABOUT_AUTOMATA_EN'];
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
    cURRENCYSAMPLE = json['CURRENCY_SAMPLE'];
    cURRENCYAR = json['CURRENCY_AR'];
    cURRENCYEN = json['CURRENCY_EN'];
    cHATENABLE = json['CHAT_ENABLE'];
    cHATURL = json['CHAT_URL'];
    cHATSOCKETURL = json['CHAT_SOCKET_URL'];
    cHATWSKEY = json['CHAT_WS_KEY'];
    cHATWSHOST = json['CHAT_WS_HOST'];
    mAINTENANCE = json['MAINTENANCE'];
    mAINTENANCEMESSAGE = json['MAINTENANCE_MESSAGE'];
    wEBURL = json['WEB_URL'];
    if (json['EXTRA_ATTRIBUTE'] != null) {
      eXTRAATTRIBUTE = [];
      json['EXTRA_ATTRIBUTE'].forEach((v) {
        eXTRAATTRIBUTE!.add(v); // v is of dynamic type
      });
    }
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
    data['APP_ABOUT_EN'] = aPPABOUTEN;
    data['APP_ABOUT_AR'] = aPPABOUTAR;
    data['APP_POLICY_EN'] = aPPPOLICYEN;
    data['APP_POLICY_AR'] = aPPPOLICYAR;
    data['ABOUT_AUTOMATA_AR'] = aBOUTAUTOMATAAR;
    data['ABOUT_AUTOMATA_EN'] = aBOUTAUTOMATAEN;
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
    data['CURRENCY_SAMPLE'] = cURRENCYSAMPLE;
    data['CURRENCY_AR'] = cURRENCYAR;
    data['CURRENCY_EN'] = cURRENCYEN;
    data['CHAT_ENABLE'] = cHATENABLE;
    data['CHAT_URL'] = cHATURL;
    data['CHAT_SOCKET_URL'] = cHATSOCKETURL;
    data['CHAT_WS_KEY'] = cHATWSKEY;
    data['CHAT_WS_HOST'] = cHATWSHOST;
    data['MAINTENANCE'] = mAINTENANCE;
    data['MAINTENANCE_MESSAGE'] = mAINTENANCEMESSAGE;
    data['WEB_URL'] = wEBURL;
    if (eXTRAATTRIBUTE != null) {
      data['EXTRA_ATTRIBUTE'] =
          eXTRAATTRIBUTE!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}