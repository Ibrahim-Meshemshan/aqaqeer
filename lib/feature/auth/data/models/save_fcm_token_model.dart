class SaveFcmTokenModel {
  bool? success;
  Data? data;

  SaveFcmTokenModel({this.success, this.data});

  SaveFcmTokenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? receiverTokenId;

  Data({this.receiverTokenId});

  Data.fromJson(Map<String, dynamic> json) {
    receiverTokenId = json['receiverTokenId'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiverTokenId'] = receiverTokenId;
    return data;
  }
}