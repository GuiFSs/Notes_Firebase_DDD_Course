import 'package:dartz/dartz.dart';

/// F - Failure
/// R - Response Object
/// P - Params
abstract class IUseCase<F, R, P> {
  Future<Either<F, R>> call([P params]);
}
