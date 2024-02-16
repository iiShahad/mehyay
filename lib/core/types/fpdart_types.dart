import 'package:fpdart/fpdart.dart';
import 'package:mehyay/core/types/failure.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;
typedef FutureVoid = Future<Either<Failure, void>>;
