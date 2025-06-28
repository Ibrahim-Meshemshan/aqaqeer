part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetStatesEvent extends ProfileEvent {
  final String? key;

  const GetStatesEvent({this.key});

  @override
  List<Object?> get props => [key];
}

class GetGendersEvent extends ProfileEvent {
  const GetGendersEvent();

  @override
  List<Object?> get props => [];
}

class GetPersonalProfileEvent extends ProfileEvent {
  const GetPersonalProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetContactProfileEvent extends ProfileEvent {
  const GetContactProfileEvent();

  @override
  List<Object?> get props => [];
}

class GetMaritalStatusEvent extends ProfileEvent {
  const GetMaritalStatusEvent();

  @override
  List<Object?> get props => [];
}

class UpdatePersonalProfileEvent extends ProfileEvent {
  final PersonalProfileParam param;

  const UpdatePersonalProfileEvent({required this.param});

  @override
  List<Object?> get props => [];
}
class UpdateContactProfileEvent extends ProfileEvent {
  final ContactProfileParam param;

  const UpdateContactProfileEvent({required this.param});

  @override
  List<Object?> get props => [];
}

class UploadPhotoEvent extends ProfileEvent {
  final XFile file;

  UploadPhotoEvent({required this.file});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class UpdatePersonalPhotoEvent extends ProfileEvent {
  final String id;

  UpdatePersonalPhotoEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class DeleteAccountEvent extends ProfileEvent {

  DeleteAccountEvent( );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


