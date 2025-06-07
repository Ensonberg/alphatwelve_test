import 'package:alphatwelve/core/local_storage/storage_impl.dart';
import 'package:alphatwelve/core/utils/toast_util.dart'
    show showCustomCartToast;
import 'package:alphatwelve/features/product_detail/domain/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cartStreamProvider = StreamProvider<List<CartItem>>((ref) async* {
  final box = LocalStorage.instance.box;

  List<CartItem> decodeList(dynamic rawList) {
    if (rawList is List) {
      return rawList.map((e) {
        if (e is CartItem) return e;
        if (e is Map) return CartItem.fromMap(Map<String, dynamic>.from(e));
        throw Exception('Invalid cart item type in list');
      }).toList();
    }
    return [];
  }

  yield decodeList(box.get('carts'));

  await for (final event in box.watch(key: 'carts')) {
    yield decodeList(box.get('carts'));
  }
});

final cartProvider = ChangeNotifierProvider<CartNotifier>(
  (ref) => CartNotifier(),
);

class CartNotifier extends ChangeNotifier {
  //final Box<CartItem> _box =LocalStorage.instance.;

  List<CartItem> get items => LocalStorage.instance.geCartList() ?? [];

  double get subtotal =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  Future<void> addToCart(CartItem product, BuildContext context) async {
    final cart = LocalStorage.instance.geCartList();
    final index = cart.indexWhere((item) => item.id == product.id);

    if (index != -1) {
      final updated = cart[index].copyWith(quantity: cart[index].quantity + 1);
      cart[index] = updated;
    } else {
      cart.add(product);
    }

    await LocalStorage.instance.saveCartList(cart);
    debugPrint(LocalStorage.instance.geCartList().length.toString());
    showCustomCartToast(context);
    notifyListeners();
  }

  void increaseQuantity(CartItem item) async {
    final cart = LocalStorage.instance.geCartList();
    final index = cart.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      cart[index] = cart[index].copyWith(quantity: cart[index].quantity + 1);
      await LocalStorage.instance.saveCartList(cart);
      notifyListeners();
    }
  }

  void decreaseQuantity(CartItem item) async {
    final cart = LocalStorage.instance.geCartList();
    final index = cart.indexWhere((e) => e.id == item.id);
    if (index != -1) {
      if (cart[index].quantity > 1) {
        cart[index] = cart[index].copyWith(quantity: cart[index].quantity - 1);
      } else {
        cart.removeAt(index);
      }
      await LocalStorage.instance.saveCartList(cart);
      notifyListeners();
    }
  }

  void removeItem(CartItem item) async {
    final cart = LocalStorage.instance.geCartList();
    cart.removeWhere((e) => e.id == item.id);
    await LocalStorage.instance.saveCartList(cart);
    notifyListeners();
  }

  void clearCart() {
    // _box.clear();
    notifyListeners();
  }
}
