class   NewsModel {
  bool? success;
  Data? data;

  NewsModel({this.success, this.data});

   NewsModel.fromJson(Map<String, dynamic> json) {
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
  List<News>? news;

  Data({this.news});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['News'] != null) {
      news = <News>[];
      json['News'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (news != null) {
      data['News'] = news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? nEWSTITLE;
  String? nEWSBODY;
  String? nEWSDATE;

  News({this.nEWSTITLE, this.nEWSBODY, this.nEWSDATE});

  News.fromJson(Map<String, dynamic> json) {
    nEWSTITLE = json['NEWS_TITLE'];
    nEWSBODY = json['NEWS_BODY'];
    nEWSDATE = json['NEWS_DATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NEWS_TITLE'] = nEWSTITLE;
    data['NEWS_BODY'] = nEWSBODY;
    data['NEWS_DATE'] = nEWSDATE;
    return data;
  }
}
