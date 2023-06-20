class TopUpResponse {
  List<TopUpdataData>? data;
  Metadata? metadata;

  TopUpResponse({this.data, this.metadata});

  TopUpResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TopUpdataData>[];
      json['data'].forEach((v) {
        data!.add(TopUpdataData.fromJson(v));
      });
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    return data;
  }
}

class TopUpdataData {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String userId;
  String vaNumber;
  String vaStatus;
  String bankCode;
  int amount;
  int expirationTime;
  String usernameDisplay;

  TopUpdataData({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userId,
    required this.vaNumber,
    required this.vaStatus,
    required this.bankCode,
    required this.amount,
    required this.expirationTime,
    required this.usernameDisplay,
  });

  TopUpdataData copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
    String? userId,
    String? vaNumber,
    String? vaStatus,
    String? bankCode,
    int? amount,
    int? expirationTime,
    String? usernameDisplay,
  }) =>
      TopUpdataData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        userId: userId ?? this.userId,
        vaNumber: vaNumber ?? this.vaNumber,
        vaStatus: vaStatus ?? this.vaStatus,
        bankCode: bankCode ?? this.bankCode,
        amount: amount ?? this.amount,
        expirationTime: expirationTime ?? this.expirationTime,
        usernameDisplay: usernameDisplay ?? this.usernameDisplay,
      );
  factory TopUpdataData.fromJson(Map<String, dynamic> json) => TopUpdataData(
        id: json['id'],
        createdAt: json['CreatedAt'],
        updatedAt: json['UpdatedAt'],
        deletedAt: json['DeletedAt'],
        userId: json['user_id'],
        vaNumber: json['va_number'],
        vaStatus: json['va_status'],
        bankCode: json['bank_code'],
        amount: json['amount'],
        expirationTime: json['expiration_time'],
        usernameDisplay: json['username_display'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "CreatedAt": createdAt,
        "UpdatedAt": updatedAt,
        "DeletedAt": deletedAt,
        "user_id": userId,
        "va_number": vaNumber,
        "va_status": vaStatus,
        "bank_code": bankCode,
        "amount": amount,
        "expiration_time": expirationTime,
        "username_display": usernameDisplay,
      };
}

class Metadata {
  int? status;
  String? message;

  Metadata({this.status, this.message});

  Metadata.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
