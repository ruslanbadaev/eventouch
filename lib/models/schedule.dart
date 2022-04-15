import 'item.dart';

class OrderModel {
  final int id;
  final String status;
  final List<ItemModel> items;

  OrderModel({
    required this.id,
    required this.status,
    required this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      status: json['status'],
      items: json['items'],
    );
  }
}
