abstract class AppAsyncUseCase<T, Params> {
  Future<T> execute(Params params);
}
abstract class AppUseCase<T, Params> {
  T execute(Params params);
}

class NoParams {
  const NoParams();
}