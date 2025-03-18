class NetworkException {
  final int? statusCode;
  final String? message;

  NetworkException({
    this.statusCode,
    this.message,
  });

  @override
  String toString() {
    return 'DioException - Status Code: $statusCode, Message: $message';
  }
}
