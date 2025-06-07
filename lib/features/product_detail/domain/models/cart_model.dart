import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String imageUrl;

  @HiveField(3)
  double price;

  @HiveField(4)
  int quantity;

  //<editor-fold desc="Data Methods">
  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          imageUrl == other.imageUrl &&
          price == other.price &&
          quantity == other.quantity);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      imageUrl.hashCode ^
      price.hashCode ^
      quantity.hashCode;

  @override
  String toString() {
    return 'CartItem{' +
        ' id: $id,' +
        ' title: $title,' +
        ' imageUrl: $imageUrl,' +
        ' price: $price,' +
        ' quantity: $quantity,' +
        '}';
  }

  CartItem copyWith({
    String? id,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'imageUrl': this.imageUrl,
      'price': this.price,
      'quantity': this.quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
  }

  //</editor-fold>
}
