import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';

import '../common/network/failure.dart';



abstract class UseCase<type, Param> {
  Future<Either<Failure, type>> call(Param param);
}

class NoParam extends Equatable {
  const NoParam();

  @override
  List<Object?> get props => [];
}
