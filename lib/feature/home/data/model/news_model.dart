class NewsModel {
  NewsModel({
      this.data,});

  NewsModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(News.fromJson(v));
      });
    }
  }
  List<News>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class News {
  News({
      this.id, 
      this.title, 
      this.buttonTitle, 
      this.imagePath, 
      this.publishAt, 
      this.withActionButton, 
      this.link, 
      this.routing, 
      this.routeToPage, 
      this.routToLink, 
      this.pageCode, 
      this.hasPermission,});

  News.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    buttonTitle = json['button_title'];
    imagePath = json['image_path'];
    publishAt = json['publish_at'];
    withActionButton = json['with_action_button'];
    link = json['link'];
    routing = json['routing'];
    routeToPage = json['route_to_page'];
    routToLink = json['rout_to_link'];
    pageCode = json['page_code'];
    hasPermission = json['has_permission'];
  }
  num? id;
  String? title;
  dynamic buttonTitle;
  String? imagePath;
  String? publishAt;
  num? withActionButton;
  dynamic link;
  dynamic routing;
  bool? routeToPage;
  bool? routToLink;
  dynamic pageCode;
  bool? hasPermission;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['button_title'] = buttonTitle;
    map['image_path'] = imagePath;
    map['publish_at'] = publishAt;
    map['with_action_button'] = withActionButton;
    map['link'] = link;
    map['routing'] = routing;
    map['route_to_page'] = routeToPage;
    map['rout_to_link'] = routToLink;
    map['page_code'] = pageCode;
    map['has_permission'] = hasPermission;
    return map;
  }

}