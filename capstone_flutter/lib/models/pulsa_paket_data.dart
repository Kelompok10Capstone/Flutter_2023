class PulsaPaketDataResponse {
  List<PulsaPaketdataData>? data;
  Metadata? metadata;

  PulsaPaketDataResponse({this.data, this.metadata});

  PulsaPaketDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PulsaPaketdataData>[];
      json['data'].forEach((v) {
        data!.add(PulsaPaketdataData.fromJson(v));
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

class PulsaPaketdataData {
  final String id;
  final String name;
  final String type;
  final String code;
  final String provider;
  final int price;
  final bool isActive;
  final String description;

  late bool isSelected = false;

  PulsaPaketdataData({
    required this.id,
    required this.name,
    required this.type,
    required this.code,
    required this.provider,
    required this.price,
    required this.isActive,
    required this.description,
  });

  PulsaPaketdataData copyWith({
    String? id,
    String? name,
    String? type,
    String? code,
    String? provider,
    int? price,
    bool? isActive,
    String? description,
  }) =>
      PulsaPaketdataData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        code: code ?? this.code,
        provider: provider ?? this.provider,
        price: price ?? this.price,
        isActive: isActive ?? this.isActive,
        description: description ?? this.description,
      );

  factory PulsaPaketdataData.fromJson(Map<String, dynamic> json) =>
      PulsaPaketdataData(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        code: json["code"],
        provider: json["provider"],
        price: json["price"],
        isActive: json["is_active"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "code": code,
        "provider": provider,
        "price": price,
        "is_active": isActive,
        "description": description,
      };
}
// class PulsaPaketdataData {
//   String? id;
//   String? name;
//   String? type;
//   String? code;
//   String? provider;
//   double? price;
//   bool? isActive;
//   String? description;

//   PulsaPaketdataData(
//       {this.id,
//       this.name,
//       this.type,
//       this.code,
//       this.provider,
//       this.price,
//       this.isActive,
//       this.description});

//   PulsaPaketdataData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     type = json['type'];
//     code = json['code'];
//     provider = json['provider'];
//     price = json['price'];
//     isActive = json['is_active'];
//     description = json['description'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['type'] = type;
//     data['code'] = code;
//     data['provider'] = provider;
//     data['price'] = price;
//     data['is_active'] = isActive;
//     data['description'] = description;
//     return data;
//   }
// }

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
