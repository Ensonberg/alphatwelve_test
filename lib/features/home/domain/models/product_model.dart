class Product {
  final String imageUrl;
  final String title;

  final double price;
  final int id;

  //<editor-fold desc="Data Methods">
  const Product({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          title == other.title &&
          price == other.price &&
          id == other.id);

  @override
  int get hashCode =>
      imageUrl.hashCode ^ title.hashCode ^ price.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' imageUrl: $imageUrl,' +
        ' title: $title,' +
        ' price: $price,' +
        ' id: $id,' +
        '}';
  }

  Product copyWith({String? imageUrl, String? title, double? price, int? id}) {
    return Product(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      price: price ?? this.price,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
      'title': this.title,
      'price': this.price,
      'id': this.id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      imageUrl: map['imageUrl'] as String,
      title: map['title'] as String,
      price: map['price'] as double,
      id: map['id'] as int,
    );
  }

  //</editor-fold>
}
