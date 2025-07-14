// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../core/bloc_status.dart';
import '../../../../core/injection/injection.dart';
import '../../../auth/data/models/save_fcm_token_model.dart';
import '../../app_manager/data/data_source/local/app_manager_local.dart';
import '../../app_manager/data/model/app_info_model.dart';
import '../../app_manager/data/model/customer_model.dart';
import '../../app_manager/data/model/delete_fcm_token_model.dart';
import '../../app_manager/data/model/permissions_model.dart';
import '../../app_manager/data/repo/app_manager_repo_imp.dart';
import '../../app_manager/domain/entity/save_fcm_token_param.dart';
import '../../app_manager/domain/entity/send_error_param.dart';

part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  late StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  final AppManagerRepoImp repoImp;

  AppManagerBloc({required this.repoImp}) : super(const AppManagerState()) {
    on<AppManagerEvent>((event, emit) async {
        if (event is SaveFcmTokenEvent) {
          emit(state.copyWith(saveFcmTokenState: BlocStatus.loading()));
          final result = await repoImp.saveFcmToken(
            saveFcmTokenParams: event.saveFcmTokenParams,
          );
          log('result is $result');
          result.fold(
                (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                  saveFcmTokenState: BlocStatus.fail(error: fail.message)));
            },
                (model) {
              // emit(state.copyWith(
              //     saveFcmTokenState: BlocStatus.success(model: model)));
            },
          );
        }

        if (event is DeleteFcmTokenEvent) {
          emit(state.copyWith(deleteFcmTokenState: BlocStatus.loading()));
          final result = await repoImp.deleteFcmToken(
            fcmToken: event.fcmToken,
          );
          log('result is $result');
          result.fold(
                (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                  deleteFcmTokenState: BlocStatus.fail(error: fail.message)));
            },
                (model) {
              emit(state.copyWith(
                  deleteFcmTokenState: BlocStatus.success(model: model)));
            },
          );
        }

        if (event is GetAppInfo) {
          emit(state.copyWith(appInfoState: BlocStatus.loading()));
          final result = await repoImp.getAppInfo(customerCode: event.clientCode);
          result.fold((fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
                appInfoState: BlocStatus.fail(error: fail.message)));
          }, (model) {
            emit(state.copyWith(appInfoState: BlocStatus.success(model: model)));
          });
        }

        if (event is GetPermissions) {
          emit(state.copyWith(permissionsState: BlocStatus.loading()));
          final result = await repoImp.getPermissions();
          result.fold((fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
                permissionsState: BlocStatus.fail(error: fail.message)));
          }, (model) {
            log('Caught model: $model');

            // emit(state.copyWith(
            //     permissionsState: BlocStatus.success(model:model)));
          });
        }

        if (event is SendError) {
          emit(state.copyWith(sendErrorState: BlocStatus.loading()));
          final result = await repoImp.sendError(errorParam: event.errorParam);
          result.fold((fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
                sendErrorState: BlocStatus.fail(error: fail.message)));
          }, (model) {
            log('Caught model: $model');

            emit(
                state.copyWith(sendErrorState: BlocStatus.success(model: model)));
          });
        }
      });

      _connectivitySubscription = Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) async {
        if (result.contains(ConnectivityResult.wifi) ||
            result.contains(ConnectivityResult.mobile) ||
            result.contains(ConnectivityResult.bluetooth)) {
          add(GetAppInfo(
              clientCode: locator.get<AppManagerLocal>().getClientCode() ?? ''));
          final errors = await locator.get<AppManagerLocal>().getErrors();

          for (var error in errors) {
            add(SendError(errorParam: error));
          }
          await locator.get<AppManagerLocal>().clearErrors();
        }
      // });

    }
    );}
}

