import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';
import 'package:petli_assignment/feature/common/model/error.dart';

Future<Either<RemoteError, T>> executeSafely<R, T>(
  Future<R?> networkRequest,
  T Function(R) converter,
) async {
  try {
    final result = await networkRequest;
    if (result == null) {
      return Left(RemoteError.unexpected());
    } else {
      return Right(converter(result));
    }
  } on DioError catch (error) {
    final code = error.response?.statusCode;
    final message = error.response?.statusMessage;
    if (error.type == DioErrorType.response && code != null) {
      return Left(RemoteError.server(code, message ?? ''));
    } else {
      return Left(RemoteError.network());
    }
  } catch (error) {
    return Left(RemoteError.unexpected(error.toString()));
  }
}

extension EitherExtention<L, R> on Either<L, R> {
  Future<Either<L, R>> doOnRightAsync(Future Function(R) callable) => fold(
        (error) async => Left<L, R>(error),
        (result) async {
          await callable(result);

          return Right<L, R>(result);
        },
      );

  Either<L, R> doOnRight(Function(R) callable) => fold(
        Left<L, R>.new,
        (result) {
          callable(result);

          return Right<L, R>(result);
        },
      );

  Future<Either<L, T>> mapRightAsync<T>(Future<T> Function(R) mapper) => fold(
        (error) async => Left<L, T>(error),
        (result) async {
          final mappedResult = await mapper(result);

          return Right<L, T>(mappedResult);
        },
      );

  R? get valueOrNull => fold((error) => null, (result) => result);

  L? get errorOrNull => fold((error) => error, (result) => null);
}
