class TopUp {
    final Data data;
    final Metadata metadata;

    TopUp({
        required this.data,
        required this.metadata,
    });

    factory TopUp.fromJson(Map<String, dynamic> json) => TopUp(
        data: Data.fromJson(json["data"]),
        metadata: Metadata.fromJson(json["metadata"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "metadata": metadata.toJson(),
    };
}

class Data {
    final String id;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String userId;
    final String vaNumber;
    final String vaStatus;
    final String bankCode;
    final int amount;
    final int expirationTime;
    final String usernameDisplay;

    Data({
        required this.id,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.vaNumber,
        required this.vaStatus,
        required this.bankCode,
        required this.amount,
        required this.expirationTime,
        required this.usernameDisplay,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        userId: json["user_id"],
        vaNumber: json["va_number"],
        vaStatus: json["va_status"],
        bankCode: json["bank_code"],
        amount: json["amount"],
        expirationTime: json["expiration_time"],
        usernameDisplay: json["username_display"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
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
    final int status;
    final String message;

    Metadata({
        required this.status,
        required this.message,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
