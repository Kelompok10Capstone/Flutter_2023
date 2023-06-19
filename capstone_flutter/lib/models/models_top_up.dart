class TopUp {
  final String vaNumber;
  final String usernameDisplay;

  TopUp({required this.vaNumber, required this.usernameDisplay});

  factory TopUp.fromJson(Map<String, dynamic> json) {
    return TopUp (
      vaNumber: json['vaNumber'] ?? "",
      usernameDisplay: json['usernameDisplay'] ?? "",
    );
  }
}
