import 'package:alphatwelve/core/local_storage/storage.dart';
import 'package:alphatwelve/features/product_detail/domain/models/cart_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'stroage_path.dart';

class LocalStorage implements Storage {
  static final LocalStorage _instance = LocalStorage._internal();
  static LocalStorage get instance => _instance;
  late Box _box;
  LocalStorage._internal();
  @override
  Future<void> delete({required String key}) async {
    await _box.delete(key);
    // await openBox.close();
  }

  Box get box => _box;

  @override
  dynamic get({required String key}) {
    return _box.get(key);
  }

  @override
  initStorage() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    Hive.registerAdapter(CartItemAdapter());

    _box = await Hive.openBox(cartBox);
  }

  Future<void> saveCartList(List<CartItem> cartItems) async {
    await _box.put("carts", cartItems);
  }

  @override
  Future<void> save({required String key, required dynamic value}) async {
    await _box.put(key, value);
  }

  List<CartItem> geCartList() {
    final result = _box.get("carts");
    if (result is List && result.isNotEmpty) {
      return result.map((e) {
        if (e is CartItem) {
          return e;
        } else if (e is Map) {
          return CartItem.fromMap(Map<String, dynamic>.from(e));
        } else {
          throw Exception('Unexpected type in cart list: ${e.runtimeType}');
        }
      }).toList();
    }
    return [];
  }
}
