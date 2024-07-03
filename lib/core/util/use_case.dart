import 'package:app/core/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);

  Future<Either<Failure, Type>> execute(Params params) {
    return call(params).onError((error, stackTrace) {
      late Failure failure;
      if (error is Failure) {
        failure = error;
      }
      // TODO: add more error handling
      return Future.value(Left(failure));
    });
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
