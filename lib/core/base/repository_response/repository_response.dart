import '../../failure/failure.dart';

class RepositoryResponse<T> {
  final Failure? failure;
  final T? data;

  RepositoryResponse({this.data, this.failure});
}
