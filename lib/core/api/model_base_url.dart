class ModelBaseUrl<T> {
  String code;
  String message;
  String? additional;
  T result;

  ModelBaseUrl({
    required this.code,
    required this.message,
    required this.result,
    this.additional,
  });

  // Factory method untuk membuat instance dari JSON.
  factory ModelBaseUrl.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ModelBaseUrl(
      code: json['code'],
      message: json['message'],
      additional: json['additional'],
      result: fromJsonT(json['result']), // Gunakan fungsi pembuat untuk tipe T
    );
  }

  // Konversi instance ke JSON.
  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'additional': additional,
        'result': (result as dynamic).toJson(),
      };
}
