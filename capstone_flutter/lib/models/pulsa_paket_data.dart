class PulsaPaketDataResponse {
  List<PulsaPaketdataData>? data;
  Metadata? metadata;
  Null? pagination;

  PulsaPaketDataResponse({this.data, this.metadata, this.pagination});

  PulsaPaketDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PulsaPaketdataData>[];
      json['data'].forEach((v) {
        data!.add(new PulsaPaketdataData.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    pagination = json['pagination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['pagination'] = this.pagination;
    return data;
  }
}

class PulsaPaketdataData {
  String? id;
  String? name;
  String? type;
  String? code;
  String? provider;
  int? price;
  bool? isActive;
  String? description;

  PulsaPaketdataData(
      {this.id,
      this.name,
      this.type,
      this.code,
      this.provider,
      this.price,
      this.isActive,
      this.description});

  PulsaPaketdataData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    code = json['code'];
    provider = json['provider'];
    price = json['price'];
    isActive = json['is_active'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['code'] = this.code;
    data['provider'] = this.provider;
    data['price'] = this.price;
    data['is_active'] = this.isActive;
    data['description'] = this.description;
    return data;
  }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
