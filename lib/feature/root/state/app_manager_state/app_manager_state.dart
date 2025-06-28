part of 'app_manager_bloc.dart';


@immutable
class AppManagerState extends Equatable {
  const AppManagerState({
    this.saveFcmTokenState = const BlocStatus(),
    this.deleteFcmTokenState = const BlocStatus(),
    this.appInfoState = const BlocStatus(),
    this.permissionsState = const BlocStatus(),
    this.sendErrorState = const BlocStatus(),
  });

  final BlocStatus<SaveFcmTokenModel> saveFcmTokenState;
  final BlocStatus<DeleteUserTokenModel> deleteFcmTokenState;
  final BlocStatus<AppInfoModel> appInfoState;
  final BlocStatus<PermissionsModel> permissionsState;
  final BlocStatus<dynamic> sendErrorState;

  @override
  List<Object?> get props => [
    saveFcmTokenState,
    deleteFcmTokenState,
    appInfoState,
    permissionsState,
    sendErrorState,
  ];

  AppManagerState copyWith({
    BlocStatus<CustomerModel>? customerState,
    BlocStatus<SaveFcmTokenModel>? saveFcmTokenState,
    BlocStatus<DeleteUserTokenModel>? deleteFcmTokenState,
    BlocStatus<AppInfoModel>? appInfoState,
    BlocStatus<PermissionsModel>? permissionsState,
    BlocStatus<dynamic>? sendErrorState,
  }) {
    return AppManagerState(
      saveFcmTokenState: saveFcmTokenState ?? this.saveFcmTokenState,
      deleteFcmTokenState: deleteFcmTokenState ?? this.deleteFcmTokenState,
      appInfoState: appInfoState ?? this.appInfoState,
      permissionsState: permissionsState ?? this.permissionsState,
      sendErrorState: sendErrorState ?? this.sendErrorState,
    );
  }
}
