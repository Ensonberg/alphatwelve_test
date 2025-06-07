import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:alphatwelve/shared/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavItem extends ConsumerWidget {
  final VoidCallback onTap;
  final String title;
  final String asset;
  final bool currentIndex;
  final bool isCart;

  const BottomNavItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.asset,
    required this.currentIndex,
    this.isCart = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            height: 32.h,
            width: 56.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: currentIndex ? context.colorScheme.primary : null,
            ),
            duration: Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Stack(
                children: [
                  Center(
                    child: SvgPicture.asset(
                      asset,
                      colorFilter: ColorFilter.mode(
                        currentIndex ? Colors.white : context.colorScheme.scrim,
                        BlendMode.srcIn,
                      ),

                      // height: 20.h,width: 18.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  if (isCart)
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color:
                              currentIndex
                                  ? context.colorScheme.primary
                                  : context.colorScheme.inverseSurface,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: ref
                              .watch(cartStreamProvider)
                              .when(
                                data:
                                    (cartItems) => Text(
                                      cartItems.length.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                loading:
                                    () => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                error:
                                    (e, _) => Center(child: Text('Error: $e')),
                              ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: currentIndex ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14.sp,
              color:
                  currentIndex
                      ? context.colorScheme.primary
                      : context.colorScheme.scrim,
            ),
          ),
        ],
      ),
    );
  }
}
