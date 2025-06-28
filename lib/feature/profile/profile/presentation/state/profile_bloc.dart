import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../../../core/bloc_status.dart';
import '../../data/model/contact_profile_model.dart';
import '../../data/model/countries_model.dart';
import '../../data/model/gender_model.dart';
import '../../data/model/marital_status_model.dart';
import '../../data/model/personal_profile_model.dart';
import '../../data/repo/profile_repo_impl.dart';
import '../../domain/entities/contact_profile_param.dart';
import '../../domain/entities/personal_profile_param.dart';



part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepoImpl repoImpl;

  ProfileBloc({required this.repoImpl}) : super(ProfileState()) {
    on<GetStatesEvent>((event, emit) async {
      emit(state.copyWith(statesState: BlocStatus.loading()));
      final result = await repoImpl.getStates(event.key ?? '');
      result.fold(
        (fail) => emit(state.copyWith(
            statesState: BlocStatus.fail(error: fail.message))),
        (data) => emit(
            state.copyWith(statesState: BlocStatus.success(model: data))),
      );
    });

    on<GetGendersEvent>((event, emit) async {
      emit(state.copyWith(gendersState: BlocStatus.loading()));
      final result = await repoImpl.getGenders();
      result.fold(
        (fail) => emit(
            state.copyWith(gendersState: BlocStatus.fail(error: fail.message))),
        (data) =>
            emit(state.copyWith(gendersState: BlocStatus.success(model: data))),
      );
    });

    on<GetPersonalProfileEvent>((event, emit) async {
      emit(state.copyWith(personalProfileState: BlocStatus.loading()));
      final result = await repoImpl.getPersonalProfile();
      result.fold(
        (fail) => emit(state.copyWith(
            personalProfileState: BlocStatus.fail(error: fail.message))),
        (data) => emit(state.copyWith(
            personalProfileState: BlocStatus.success(model: data))),
      );
    });

    on<GetContactProfileEvent>((event, emit) async {
      emit(state.copyWith(contactProfileState: BlocStatus.loading()));
      final result = await repoImpl.getContactProfile();
      result.fold(
        (fail) => emit(state.copyWith(
            contactProfileState: BlocStatus.fail(error: fail.message))
        ),
        (data) => emit(state.copyWith(
            contactProfileState: BlocStatus.success(model: data))),
      );
    });

    on<UpdatePersonalProfileEvent>((event, emit) async {
      emit(state.copyWith(updatePersonalProfileState: BlocStatus.loading()));
      final result = await repoImpl.updatePersonalProfile(param: event.param);
      result.fold(
        (fail) => emit(state.copyWith(
            updatePersonalProfileState: BlocStatus.fail(error: fail.message))),
        (data) => emit(state.copyWith(
            updatePersonalProfileState: BlocStatus.success(model: data))),
      );
    });


    on<UpdateContactProfileEvent>((event, emit) async {
      emit(state.copyWith(updateContactProfileState: BlocStatus.loading()));
      final result = await repoImpl.updateContactProfile(param: event.param);
      result.fold(
        (fail) => emit(state.copyWith(
            updateContactProfileState: BlocStatus.fail(error: fail.message))),
        (data) => emit(state.copyWith(
            updateContactProfileState: BlocStatus.success(model: data))),
      );
    });

    on<GetMaritalStatusEvent>((event, emit) async {
      emit(state.copyWith(maritalStatusState: BlocStatus.loading()));
      final result = await repoImpl.getMaritalStatus();
      result.fold(
        (fail) => emit(state.copyWith(
            maritalStatusState: BlocStatus.fail(error: fail.message))),
        (data) => emit(state.copyWith(
            maritalStatusState: BlocStatus.success(model: data))),
      );
    });

    on<UploadPhotoEvent>((event, emit) async {
      emit(state.copyWith(uploadPhotoState: BlocStatus.loading()));
      final result = await repoImpl.uploadPhoto(file: event.file);
      result.fold((fail) {
        log('Caught error: ${fail.message}');
        emit(state.copyWith(
            uploadPhotoState: BlocStatus.fail(error: fail.message)));
      }, (model) {
        emit(
            state.copyWith(uploadPhotoState: BlocStatus.success(model: model)));
      });
    });
    on<UpdatePersonalPhotoEvent>((event, emit) async {
      emit(state.copyWith(updatePersonalPhotoState: BlocStatus.loading()));
      final result = await repoImpl.updatePersonalPhoto(id: event.id);
      result.fold((fail) {
        log('Caught error: ${fail.message}');
        emit(state.copyWith(
            updatePersonalPhotoState: BlocStatus.fail(error: fail.message)));
      }, (model) {
        emit(
            state.copyWith(updatePersonalPhotoState: BlocStatus.success(model: model)));
      });
    });
    on<DeleteAccountEvent>((event, emit) async {
      emit(state.copyWith(deleteAccountState: BlocStatus.loading()));
      final result = await repoImpl.deleteAccount( );
      result.fold((fail) {
        log('Caught error: ${fail.message}');
        emit(state.copyWith(
            deleteAccountState: BlocStatus.fail(error: fail.message)));
      }, (model) {
        emit(
            state.copyWith(deleteAccountState: BlocStatus.success(model: model)));
      });
    });

  }
}
