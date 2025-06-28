class StatesModel {
  List<CountriesModelData>? data;

  StatesModel({this.data});

  StatesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CountriesModelData>[];
      json['data'].forEach((v) {
        data!.add(new CountriesModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountriesModelData {
  int? value;
  String? text;

  CountriesModelData({this.value, this.text});

  CountriesModelData.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['text'] = this.text;
    return data;
  }
}