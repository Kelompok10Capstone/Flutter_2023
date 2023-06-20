class Transaction {
  final String id;
  final String userId;
  final String status;
  final String productType;
  final Map<String, dynamic> productDetail;
  final String description;
  final int discountPrice;
  final int adminFee;
  final int price;
  final int amount;
  final int totalPrice;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.status,
    required this.productType,
    required this.productDetail,
    required this.description,
    required this.discountPrice,
    required this.adminFee,
    required this.price,
    required this.amount,
    required this.totalPrice,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      status: json['status'],
      productType: json['product_type'],
      productDetail: json['product_detail'],
      description: json['description'],
      discountPrice: json['discount_price'],
      adminFee: json['admin_fee'],
      price: json['price'],
      amount: json['amount'] ?? 0,
      totalPrice: json['total_price'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'] ?? '',
    );
  }
}
