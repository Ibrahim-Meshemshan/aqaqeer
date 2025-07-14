class NewsDetailsModel {
  NewsDetailsModel({
      this.data,});

  NewsDetailsModel.fromJson(dynamic json) {
    data = json['data'] != null ? NewsDetails.fromJson(json['data']) : null;
  }
  NewsDetails? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class NewsDetails {
  NewsDetails({
      this.id, 
      this.title, 
      this.content, 
      this.buttonTitle, 
      this.summary, 
      this.status, 
      this.statusId, 
      this.category, 
      this.categoryId, 
      this.tag, 
      this.imagePath, 
      this.publishAt, 
      this.showStart, 
      this.showEnd, 
      this.withActionButton, 
      this.pageId, 
      this.page, 
      this.link, 
      this.routing, 
      this.routeToPage, 
      this.routToLink, 
      this.pageCode, 
      this.hasPermission,});

  NewsDetails.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    buttonTitle = json['button_title'];
    summary = json['summary'];
    status = json['status'];
    statusId = json['status_id'];
    category = json['category'];
    categoryId = json['category_id'];
    if (json['tag'] != null) {
      tag = [];
      json['tag'].forEach((v) {
        tag?.add(Tag.fromJson(v));
      });
    }
    imagePath = json['image_path'];
    publishAt = json['publish_at'];
    showStart = json['show_start'];
    showEnd = json['show_end'];
    withActionButton = json['with_action_button'];
    pageId = json['page_id'];
    page = json['page'];
    link = json['link'];
    routing = json['routing'];
    routeToPage = json['route_to_page'];
    routToLink = json['rout_to_link'];
    pageCode = json['page_code'];
    hasPermission = json['has_permission'];
  }
  num? id;
  String? title;
  String? content;
  dynamic buttonTitle;
  dynamic summary;
  String? status;
  num? statusId;
  String? category;
  num? categoryId;
  List<Tag>? tag;
  String? imagePath;
  String? publishAt;
  dynamic showStart;
  dynamic showEnd;
  num? withActionButton;
  dynamic pageId;
  dynamic page;
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
    map['content'] = content;
    map['button_title'] = buttonTitle;
    map['summary'] = summary;
    map['status'] = status;
    map['status_id'] = statusId;
    map['category'] = category;
    map['category_id'] = categoryId;
    if (tag != null) {
      map['tag'] = tag?.map((v) => v.toJson()).toList();
    }
    map['image_path'] = imagePath;
    map['publish_at'] = publishAt;
    map['show_start'] = showStart;
    map['show_end'] = showEnd;
    map['with_action_button'] = withActionButton;
    map['page_id'] = pageId;
    map['page'] = page;
    map['link'] = link;
    map['routing'] = routing;
    map['route_to_page'] = routeToPage;
    map['rout_to_link'] = routToLink;
    map['page_code'] = pageCode;
    map['has_permission'] = hasPermission;
    return map;
  }

}

class Tag {
  Tag({
      this.id, 
      this.name, 
      this.color,});

  Tag.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }
  num? id;
  String? name;
  dynamic color;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['color'] = color;
    return map;
  }

}