class TagihanListrikInquiryRequest {
  final String customerId;
  late String? discountId;
  late String productId;

  TagihanListrikInquiryRequest({
    required this.customerId,
    this.discountId,
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

class TagihanListrikInquiryResponse {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final Map<String, dynamic> productDetail;
  final String description;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int totalPrice;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;
  final String name;
  final String token;
  final int electricalPower;
  final String providerName;
  final int productPrice;
  final String discountId;

  TagihanListrikInquiryResponse({
    required this.id,
    required this.userId,
    required this.status,
    required this.productType,
    required this.productDetail,
    required this.description,
    required this.discountPrice,
    required this.adminFee,
    required this.price,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.name,
    required this.token,
    required this.electricalPower,
    required this.providerName,
    required this.productPrice,
    required this.discountId,
  });

  factory TagihanListrikInquiryResponse.fromJson(Map<String, dynamic> json) {
    return TagihanListrikInquiryResponse(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: json['product_detail'] != null
          ? Map<String, dynamic>.from(json['product_detail'])
          : {},
      description: json['description'] ?? '',
      discountPrice: json['discount_price'] ?? 0,
      adminFee: json['admin_fee'] ?? 0,
      price: json['price'] ?? 0,
      totalPrice: json['total_price'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
      name: json['product_detail']['name'],
      token: json['token'] ?? '',
      electricalPower: json['product_detail']['electrical_power'],
      providerName: json['product_detail']['provider_name'],
      productPrice: json['product_price'] ?? 0,
      discountId: json['discount_id'] ?? '',
      // id: json['id'],
      // userId: json['user_id'],
      // status: json['status'],
      // productType: json['product_type'],
      // productDetail: json['product_detail'] != null
      //     ? Map<String, dynamic>.from(json['product_detail'])
      //     : {},
      // // productDetail: json['product_detail'],
      // description: json['product_detail'] != null
      //     ? json['product_detail']['description']
      //     : '',
      // discountPrice: json['discount_price'],
      // adminFee: json['admin_fee'],
      // price: json['price'],
      // totalPrice: json['total_price'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      // deletedAt: json['deleted_at'],
      // name:
      //     json['product_detail'] != null ? json['product_detail']['name'] : '',
      // token:
      //     json['product_detail'] != null ? json['product_detail']['token'] : '',
      // electricalPower: json['product_detail'] != null
      //     ? json['product_detail']['electrical_power']
      //     : '',
      // providerName: json['product_detail'] != null
      //     ? json['product_detail']['provider_name']
      //     : '',
      // productPrice: json['product_detail'] != null
      //     ? json['product_detail']['product_price']
      //     : 0,
      // discountId: json['product_detail'] != null
      //     ? json['product_detail']['discount_id']
      //     : '',
      // name: json['product_detail']['name'],
      // token: json['product_detail']['token'],
      // electricalPower: json['product_detail']['electrical_power'],
      // providerName: json['product_detail']['provider_name'],
      // productPrice: json['product_detail']['product_price'],
      // discountId: json['product_detail']['discount_id'],
    );
  }
}
