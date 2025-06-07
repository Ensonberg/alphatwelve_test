import 'package:alphatwelve/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainController extends ChangeNotifier {
  final Ref ref;
  MainController(this.ref);
  int currentIndex = 0;

  void onTap(BuildContext context, int value) {
    currentIndex = value;
    notifyListeners();
    switch (value) {
      case 0:
        return context.go(Routes.HOME);
      case 1:
        return context.goNamed(Routes.CART);

      default:
        return context.go(Routes.HOME);
    }
  }
}

final mainProvider = Provider<MainController>((ref) {
  return MainController(ref);
});
