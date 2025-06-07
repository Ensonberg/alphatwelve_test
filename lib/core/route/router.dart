import 'package:alphatwelve/core/route/routes.dart';
import 'package:alphatwelve/features/cart/presentation/screens/cart_screen.dart';
import 'package:alphatwelve/features/home/domain/models/product_model.dart';
import 'package:alphatwelve/features/home/presentation/screens/home_screen.dart';
import 'package:alphatwelve/features/main/presentation/screens/main_screen.dart';
import 'package:alphatwelve/features/product_detail/presentation/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  restorationScopeId: "app",
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainScreen(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.HOME,
          pageBuilder:
              (context, state) => NoTransitionPage(child: HomeScreen()),
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              name: Routes.PRODUCTDETAIL,
              path: Routes.PRODUCTDETAIL,
              pageBuilder: (context, state) {
                Product product = state.extra as Product;
                return NoTransitionPage(
                  child: ProductDetailScreen(product: product),
                );
              },
              routes: [],
            ),
            GoRoute(
              path: Routes.CART,
              name: Routes.CART,
              parentNavigatorKey: _rootNavigatorKey,
              pageBuilder:
                  (context, state) => NoTransitionPage(child: CartScreen()),
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
