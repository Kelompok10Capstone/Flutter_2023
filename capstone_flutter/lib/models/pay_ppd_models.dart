class CreateTransaksiResponse {
  final String? type;
  final String? phoneNumber;
  final String? productId;
  final String? discontId;

  CreateTransaksiResponse({
    this.type,
    this.phoneNumber,
    this.productId,
    this.discontId,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'phone_number': phoneNumber,
      'product_id': productId,
      'discont_id': discontId,
    };
  }
}

class CreateTransaksiData {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final String productDetail;
  final String? description;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  CreateTransaksiData({
    required this.id,
    required this.userId,
    required this.status,
    required this.productType,
    required this.productDetail,
    this.description,
    required this.discountPrice,
    required this.adminFee,
    required this.price,
    required this.totalPrice,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory CreateTransaksiData.fromJson(Map<String, dynamic> json) {
    return CreateTransaksiData(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: json['product_detail'],
      description: json['description'],
      discountPrice: json['discount_price'],
      adminFee: json['admin_fee'],
      price: json['price'],
      totalPrice: json['total_price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}
