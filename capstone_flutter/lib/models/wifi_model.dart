class WiFiInquiryRequest {
  final String customerId;
  late String discountId;
  late String productId;

  WiFiInquiryRequest({
    required this.customerId,
    required this.discountId,
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'discount_id': discountId,
      'product_id': productId,
    };
  }
}

class WiFiInquiryResponse {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final Map<String, dynamic> productDetail;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String name;
  final String code;
  final String providerName;
  final String description;
  final int productPrice;
  final String discountId;

  WiFiInquiryResponse({
    required this.id,
    required this.userId,
    required this.status,
    required this.productType,
    required this.productDetail,
    required this.discountPrice,
    required this.adminFee,
    required this.price,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.code,
    required this.providerName,
    required this.description,
    required this.productPrice,
    required this.discountId,
  });

  factory WiFiInquiryResponse.fromJson(Map<String, dynamic> json) {
    return WiFiInquiryResponse(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: json['product_detail'],
      discountPrice: json['discount_price'],
      adminFee: json['admin_fee'],
      price: json['price'],
      totalPrice: json['total_price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
      name: json['product_detail']['name'],
      code: json['product_detail']['code'],
      providerName: json['product_detail']['provider_name'],
      description: json['product_detail'] != null
          ? json['product_detail']['description'] ?? ''
          : '',
      productPrice: json['product_detail']['price'],
      discountId: json['product_detail']['discount_id'],
    );
  }
}
