class Failure {
  String? data;

  Failure({
    this.data,
  });

  Failure.fromJson(Map<String, dynamic> json) {
    data = json['data'] ?? "Something went wrong. Please try again later.";
  }
}
