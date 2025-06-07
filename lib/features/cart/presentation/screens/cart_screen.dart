import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:alphatwelve/features/cart/presentation/widgets/action_button_widget.dart';
import 'package:alphatwelve/features/main/presentation/controllers/main_controller.dart';
import 'package:alphatwelve/generated/assets.dart';
import 'package:alphatwelve/shared/controllers/cart_controller.dart';
import 'package:alphatwelve/shared/widgets/custom_appbar.dart';
import 'package:alphatwelve/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final subtotal = cart.subtotal;
    final shipping = 10.0;
    final total = subtotal + shipping;

    return Scaffold(
      appBar: CustomAppbar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 3,
        child: CustomButton(
          onTap: () async {},
          title: "${context.tr.checkout} (\$${total.toStringAsFixed(2)})",
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  //  context.go(Routes.HOME);
                  ref.read(mainProvider).onTap(context, 0);
                },
                icon: Row(
                  children: [
                    Icon(Icons.chevron_left_rounded),
                    const Gap(8),
                    Text(
                      context.tr.your_cart,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //   const  Gap(8),
          Divider(color: AppColors.dividerColor, height: 1),
          const Gap(10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,

              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.cartColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(item.imageUrl, height: 106.h, width: 102.w),
                        const Gap(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "\$${item.price}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                context.tr.in_stock,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppColors.successColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ActionButtonWidget(
                                    onTap: () {
                                      ref
                                          .read(cartProvider)
                                          .decreaseQuantity(item);
                                    },
                                    asset: Assets.svgsRemoveIcon,
                                    color: AppColors.grey200Color,
                                    iconColor: AppColors.grey700Color,
                                  ),
                                  Text(
                                    item.quantity.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.grey700Color,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  ActionButtonWidget(
                                    onTap: () {
                                      ref
                                          .read(cartProvider)
                                          .increaseQuantity(item);
                                    },
                                    asset: Assets.svgsAddIcon,
                                    color: AppColors.whiteColor,
                                  ),
                                  ActionButtonWidget(
                                    onTap: () {
                                      ref.read(cartProvider).removeItem(item);
                                    },
                                    asset: Assets.svgsDeleteIcon,
                                    iconColor: AppColors.grey400Color,
                                    color: AppColors.whiteColor,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr.order_info,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
                _row(context.tr.subtotal, '\$${subtotal.toStringAsFixed(2)}'),
                _row(context.tr.shipping, '\$${shipping.toStringAsFixed(2)}'),

                _row('Total', '\$${total.toStringAsFixed(2)}', bold: true),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, {bool bold = false}) {
    final style =
        bold
            ? TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.w500,
              fontSize: 12.sp,
              fontFamily: "IBM Plex Sans",

              color: Colors.black,
            )
            : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label, style: style), Text(value, style: style)],
      ),
    );
  }
}
