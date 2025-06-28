import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../../../core/common/constant/src/app_url.dart';
import '../../../../../core/common/network/dio/dio_client.dart';
import '../../../../../core/injection/injection.dart';
import '../../domain/entities/contact_profile_param.dart';
import '../../domain/entities/personal_profile_param.dart';
import '../model/contact_profile_model.dart';
import '../model/countries_model.dart';
import '../model/gender_model.dart';
import '../model/marital_status_model.dart';
import '../model/personal_profile_model.dart';

class ProfileRemote {
  DioClient dioClient = locator.get<DioClient>();

  Future<StatesModel> getStates(String key) async {
    late final Response response;
    response = await dioClient.dioGet(
      //${AppUrl.getStates}$key
      url: '',
    );

    return StatesModel.fromJson(response.data);
  }

  Future<GenderModel> getGenders() async {
    late final Response response;
    response = await dioClient.dioGet(
      //${AppUrl.getGenders}
      url: '',
    );

    return GenderModel.fromJson(response.data);
  }

  Future<PersonalProfileModel> getPersonalProfile() async {
    late final Response response;
    response = await dioClient.dioGet(
      url: AppUrl.getProfileByToken,
    );

    return PersonalProfileModel.fromJson(response.data);
  }

  Future<dynamic> updatePersonalProfile(PersonalProfileParam param) async {
    late final Response response;
    response = await dioClient.dioPost(
      // url: AppUrl.getPersonalProfile,
      url: AppUrl.getProfileByToken,
      data: param.toJson(),
    );

    return response.data;
  }

  Future<dynamic> updatePersonalPhoto(String id) async {
    late final Response response;
    var data = {
      'image_id': id
    };
    response = await dioClient.dioPost(
      // url: AppUrl.updatePersonalPhoto,
      url: '',
      data: data,
    );

    return response.data;
  }

  Future<dynamic> updateContactProfile(ContactProfileParam param) async {
    late final Response response;
    response = await dioClient.dioPost(
      // url: AppUrl.getContactProfile,
      url: '',
      data: param.toJson(),
    );

    return response.data;
  }

  Future<ContactProfileModel> getContactProfile() async {
    late final Response response;
    response = await dioClient.dioGet(
      // url: AppUrl.getContactProfile,
      url: ''
    );

    return ContactProfileModel.fromJson(response.data);
  }

  Future<MaritalStatusModel> getMaritalStatus() async {
    late final Response response;
    response = await dioClient.dioGet(
      //AppUrl.getMaritalStatus
      url: '',
    );

    return MaritalStatusModel.fromJson(response.data);
  }

  Future<dynamic> uploadPhoto({required XFile file}) async {
    late final Response response;
    var data = FormData.fromMap({
      'image_id': [
        await MultipartFile.fromFile(
          file.path,
          filename: file.name,
        )
      ],
    });
    response = await dioClient.dioUpload(
      //${AppUrl.uploadFile}
        url: "",
        data: data,
        param: {'uploader': 'user_avatar'});

    return response.data;
  }
  Future<dynamic> deleteAccount() async {
    late final Response response;

    response = await dioClient.delete(
      url: "${AppUrl.deleteAccount}",
    );

    return response.data;
  }

}
