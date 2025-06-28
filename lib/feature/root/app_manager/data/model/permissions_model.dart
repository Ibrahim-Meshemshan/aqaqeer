class PermissionsModel {
  bool? success;
  List<PermissionsModelData>? data;

  PermissionsModel({this.success, this.data});

  PermissionsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <PermissionsModelData>[];
      json['data'].forEach((v) {
        data!.add(PermissionsModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PermissionsModelData {
  String? solutionName;
  String? solutionNameEn;
  String? solutionNameAr;
  String? code;
  bool? hasPermission;
  List<Modules>? modules;

  PermissionsModelData({
    this.solutionName,
    this.solutionNameEn,
    this.solutionNameAr,
    this.code,
    this.hasPermission,
    this.modules,
  });

  PermissionsModelData.fromJson(Map<String, dynamic> json) {
    solutionName = json['solution_name'];
    solutionNameEn = json['solution_name_en'];
    solutionNameAr = json['solution_name_ar'];
    code = json['code'];
    hasPermission = json['has_permission'];
    if (json['modules'] != null) {
      modules = <Modules>[];
      json['modules'].forEach((v) {
        modules!.add(Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['solution_name'] = solutionName;
    data['solution_name_en'] = solutionNameEn;
    data['solution_name_ar'] = solutionNameAr;
    data['code'] = code;
    data['has_permission'] = hasPermission;
    if (modules != null) {
      data['modules'] = modules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modules {
  String? moduleName;
  String? moduleNameEn;
  String? moduleNameAr;
  String? code;
  bool? hasPermission;
  List<Pages>? pages;

  Modules({
    this.moduleName,
    this.moduleNameEn,
    this.moduleNameAr,
    this.code,
    this.hasPermission,
    this.pages,
  });

  Modules.fromJson(Map<String, dynamic> json) {
    moduleName = json['module_name'];
    moduleNameEn = json['module_name_en'];
    moduleNameAr = json['module_name_ar'];
    code = json['code'];
    hasPermission = json['has_permission'];

    // Handle `pages` being either an array or an empty object
    if (json['pages'] is List) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    } else if (json['pages'] is Map<String, dynamic>) {
      pages = []; // Treat empty object `{}` as an empty list
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['module_name'] = moduleName;
    data['module_name_en'] = moduleNameEn;
    data['module_name_ar'] = moduleNameAr;
    data['code'] = code;
    data['has_permission'] = hasPermission;
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  String? operationName;
  String? operationNameEn;
  String? operationNameAr;
  bool? hasPermission;
  String? code;

  Pages({
    this.operationName,
    this.operationNameEn,
    this.operationNameAr,
    this.hasPermission,
    this.code,
  });

  Pages.fromJson(Map<String, dynamic> json) {
    operationName = json['operation_name'];
    operationNameEn = json['operation_name_en'];
    operationNameAr = json['operation_name_ar'];
    hasPermission = json['has_permission'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['operation_name'] = operationName;
    data['operation_name_en'] = operationNameEn;
    data['operation_name_ar'] = operationNameAr;
    data['has_permission'] = hasPermission;
    data['code'] = code;
    return data;
  }
}
