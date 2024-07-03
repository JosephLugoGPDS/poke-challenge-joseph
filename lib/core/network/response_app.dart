abstract class ResponseApp<T> {}

class Success<T> extends ResponseApp<T> {
  final T data;
  Success(this.data);
}

class ErrorApp<Failure> extends ResponseApp<Failure> {
  final Failure failure;
  ErrorApp(this.failure);
}
