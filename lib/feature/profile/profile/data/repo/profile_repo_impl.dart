import 'package:either_dart/either.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';



import '../../../../../core/common/network/error_handler.dart';
import '../../../../../core/common/network/failure.dart';
import '../../../../../core/common/network/netword_info.dart';
import '../../domain/entities/contact_profile_param.dart';
import '../../domain/entities/personal_profile_param.dart';
import '../../domain/repository/profile_repo.dart';
import '../data_source/profile_remote.dart';
import '../model/contact_profile_model.dart';
import '../model/countries_model.dart';
import '../model/gender_model.dart';
import '../model/marital_status_model.dart';
import '../model/personal_profile_model.dart';

class ProfileRepoImpl extends ProfileRepository {
  final ProfileRemote remote;
  final NetworkInfo networkInfo;

  ProfileRepoImpl({required this.networkInfo, required this.remote});

  Future<Either<Failure, StatesModel>> getStates(String key) async {
    if (await networkInfo.isConnected) {
      try {
        StatesModel model = await remote.getStates(key);
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, GenderModel>> getGenders() async {
    if (await networkInfo.isConnected) {
      try {
        GenderModel model = await remote.getGenders();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, ContactProfileModel>> getContactProfile() async {
    if (await networkInfo.isConnected) {
      try {
        ContactProfileModel model = await remote.getContactProfile();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, PersonalProfileModel>> getPersonalProfile() async {
    if (await networkInfo.isConnected) {
      try {
        PersonalProfileModel model = await remote.getPersonalProfile();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, MaritalStatusModel>> getMaritalStatus() async {
    if (await networkInfo.isConnected) {
      try {
        MaritalStatusModel model = await remote.getMaritalStatus();
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, dynamic>> updatePersonalProfile(
      {required PersonalProfileParam param}) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic model = await remote.updatePersonalProfile(param);
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, dynamic>> updateContactProfile(
      {required ContactProfileParam param}) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic model = await remote.updateContactProfile(param);
        return Right(model);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, dynamic>> uploadPhoto({required XFile file}) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic data = await remote.uploadPhoto(file: file);
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, dynamic>> updatePersonalPhoto({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic data = await remote.updatePersonalPhoto(id);
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, dynamic>> deleteAccount( ) async {
    if (await networkInfo.isConnected) {
      try {
        dynamic data = await remote.deleteAccount( );
        return Right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}
