class BpjsOrder {
  final String customerId;
  final String productId;

  BpjsOrder({
    required this.customerId,
    required this.productId,
  });

  factory BpjsOrder.fromJson(Map<String, dynamic> json) {
    return BpjsOrder(
      customerId: json['customer_id'],
      productId: json['product_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customer_id': customerId,
      'product_id': productId,
    };
  }
}


class BpjsR {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final ProductDetail productDetail;
  final String description;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int totalPrice;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  BpjsR({
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
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory BpjsR.fromJson(Map<String, dynamic> json) {
    return BpjsR(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: ProductDetail.fromJson(json['product_detail']),
      description: json['description'],
      discountPrice: json['discount_price'],
      adminFee: json['admin_fee'],
      price: json['price'],
      totalPrice: json['total_price'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null ? DateTime.parse(json['deleted_at']) : null,
    );
  }
}

class ProductDetail {
  DateTime createdAt;
  DateTime? deletedAt;
  DateTime updatedAt;
  String className;
  String customerId;
  String discountId;
  String productId;
  String name;
  int numberOfFamily;
  String period;
  int price;
  String productType;
  String providerName;

  ProductDetail({
    required this.createdAt,
    required this.deletedAt,
    required this.updatedAt,
    required this.className,
    required this.customerId,
    required this.discountId,
    required this.productId,
    required this.name,
    required this.numberOfFamily,
    required this.period,
    required this.price,
    required this.productType,
    required this.providerName,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) {
    return ProductDetail(
      createdAt: DateTime.parse(json['CreatedAt']),
      deletedAt: json['DeletedAt'] != null ? DateTime.parse(json['DeletedAt']) : null,
      updatedAt: DateTime.parse(json['UpdatedAt']),
      className: json['class'],
      customerId: json['customer_id'],
      discountId: json['discount_id'],
      productId: json['id'],
      name: json['name'],
      numberOfFamily: json['number_of_family'],
      period: json['period'],
      price: json['price'],
      productType: json['product_type'],
      providerName: json['provider_name'],
    );
  }
}
