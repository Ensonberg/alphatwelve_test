import 'package:alphatwelve/features/home/domain/models/product_model.dart';
import 'package:alphatwelve/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeController extends ChangeNotifier {
  final Ref ref;

  HomeController(this.ref);
  final List<Product> products = [
    Product(
      id: 1,
      imageUrl: Assets.imagesIphoneTealImage,
      title: 'Apple iPhone 16 128GB|Teal',
      price: 700.00,
    ),
    Product(
      id: 2,
      imageUrl: Assets.imagesMacbookAirImage,
      title: 'M4 Macbook Air 13” 256GB|Sky blue',
      price: 1000.00,
    ),
    Product(
      id: 3,
      imageUrl: Assets.imagesPixelImage,
      title: 'Google Pixel 9A 128GB|Iris',
      price: 499.00,
    ),
    Product(
      id: 4,
      imageUrl: Assets.imagesAirpodImage,
      title: 'Apple Airpods 4 Active Noise Cancellation|Teal',
      price: 129.00,
    ),
    // Add more products here...
  ];
}

final homeProvider = Provider<HomeController>((ref) {
  return HomeController(ref);
});
