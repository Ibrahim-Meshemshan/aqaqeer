part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  ProfileState({
    this.statesState = const BlocStatus(),
    this.gendersState = const BlocStatus(),
    this.personalProfileState = const BlocStatus(),
    this.maritalStatusState = const BlocStatus(),
    this.contactProfileState = const BlocStatus(),
    this.updatePersonalProfileState = const BlocStatus(),
    this.updateContactProfileState = const BlocStatus(),
    this.uploadPhotoState = const BlocStatus(),
    this.updatePersonalPhotoState = const BlocStatus(),
    this.deleteAccountState = const BlocStatus(),
  });

  final BlocStatus<StatesModel> statesState;
  final BlocStatus<GenderModel> gendersState;
  final BlocStatus<PersonalProfileModel> personalProfileState;
  final BlocStatus<ContactProfileModel> contactProfileState;
  final BlocStatus<MaritalStatusModel> maritalStatusState;
  BlocStatus<dynamic> updatePersonalProfileState;

  BlocStatus<dynamic> updateContactProfileState;

  BlocStatus<dynamic> uploadPhotoState;
  BlocStatus<dynamic> updatePersonalPhotoState;
  BlocStatus<dynamic> deleteAccountState;

  @override
  List<Object?> get props => [
    statesState,
    gendersState,
    personalProfileState,
    contactProfileState,
    maritalStatusState,
    updatePersonalProfileState,
    updateContactProfileState,
    uploadPhotoState,
    updatePersonalPhotoState,
    deleteAccountState,
  ];

  ProfileState copyWith({
    BlocStatus<StatesModel>? statesState,
    BlocStatus<GenderModel>? gendersState,
    BlocStatus<PersonalProfileModel>? personalProfileState,
    BlocStatus<MaritalStatusModel>? maritalStatusState,
    BlocStatus<ContactProfileModel>? contactProfileState,
    BlocStatus<dynamic>? updatePersonalProfileState,
    BlocStatus<dynamic>? updateContactProfileState,
    BlocStatus<dynamic>? uploadPhotoState,
    BlocStatus<dynamic>? updatePersonalPhotoState,
    BlocStatus<dynamic>? deleteAccountState,
  }) {
    return ProfileState(
      statesState: statesState ?? this.statesState,
      gendersState: gendersState ?? this.gendersState,
      personalProfileState: personalProfileState ?? this.personalProfileState,
      maritalStatusState: maritalStatusState ?? this.maritalStatusState,
      contactProfileState: contactProfileState ?? this.contactProfileState,
      updatePersonalProfileState:
          updatePersonalProfileState ?? this.updatePersonalProfileState,
      updateContactProfileState:
          updateContactProfileState ?? this.updateContactProfileState,
      uploadPhotoState: uploadPhotoState ?? this.uploadPhotoState,
      updatePersonalPhotoState:
          updatePersonalPhotoState ?? this.updatePersonalPhotoState,
      deleteAccountState: deleteAccountState ?? this.deleteAccountState,
    );
  }
}
