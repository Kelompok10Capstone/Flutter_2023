class TopUp {
  final String bankCode;

  TopUp({
    required this.bankCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'bank_code': bankCode,
    };
  }
}

class TopUpR {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;
  String userId;
  String vaNumber;
  String vaStatus;
  String bankCode;
  double amount;
  int expirationTime;
  String usernameDisplay;

  TopUpR({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.userId,
    required this.vaNumber,
    required this.vaStatus,
    required this.bankCode,
    required this.amount,
    required this.expirationTime,
    required this.usernameDisplay,
  });

  factory TopUpR.fromJson(Map<String, dynamic> json) {
    return TopUpR(
      id: json['data']['id'],
      createdAt: DateTime.parse(json['data']['CreatedAt']),
      updatedAt: DateTime.parse(json['data']['UpdatedAt']),
      deletedAt: json['data']['DeletedAt'],
      userId: json['data']['user_id'],
      vaNumber: json['data']['va_number'],
      vaStatus: json['data']['va_status'],
      bankCode: json['data']['bank_code'],
      amount: json['data']['amount'].toDouble(),
      expirationTime: json['data']['expiration_time'],
      usernameDisplay: json['data']['username_display'],
    );
  }
}