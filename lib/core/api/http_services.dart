abstract class HttpServices {
  Future<T?> get<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson});

  Future<T?> post<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson});

  Future<T?> put<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson});

  Future<T?> patch<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson});

  Future<T?> delete<T>(String uri,
      {Map<String, dynamic>? param,
      T Function(Map<String, dynamic>)? fromJson});
}
