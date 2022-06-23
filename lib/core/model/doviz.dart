class Doviz {
  double? result;

  Doviz({required this.result});

  factory Doviz.fromJson(Map<String, dynamic> json) {
    return Doviz(result: json["result"] ?? "0.0");
  }
}
