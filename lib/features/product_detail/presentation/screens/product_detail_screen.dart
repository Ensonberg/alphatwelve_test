import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:alphatwelve/features/home/domain/models/product_model.dart';
import 'package:alphatwelve/features/product_detail/domain/models/cart_model.dart';
import 'package:alphatwelve/generated/assets.dart';
import 'package:alphatwelve/shared/controllers/cart_controller.dart';
import 'package:alphatwelve/shared/widgets/custom_appbar.dart';
import 'package:alphatwelve/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  ConsumerState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppbar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 3,
        child: CustomButton(
          onTap: () async {
            final cartItem = CartItem(
              id: widget.product.id.toString(),
              title: widget.product.title,
              imageUrl: widget.product.imageUrl,
              price: widget.product.price,
            );
            await ref.read(cartProvider).addToCart(cartItem, context);
          },
          title: "Add to cart",
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.maybeOf(context)!.pop();
                },
                icon: Row(
                  children: [
                    Icon(Icons.chevron_left_rounded),
                    const Gap(8),
                    Text(
                      "Go back",
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
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 331.h,
                      width: context.screenSize.width,
                      child: Stack(
                        children: [
                          Hero(
                            tag: widget.product.imageUrl,
                            child: Container(
                              height: 331.h,
                              width: context.screenSize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(widget.product.imageUrl),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 14,
                            top: 11,
                            child: IconButton(
                              onPressed: () {},
                              icon: Container(
                                height: 44.h,
                                width: 44.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.whiteColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    Assets.svgsFavoriteUnselectedIcon,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(10),
                    Text(
                      widget.product.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      "\$${widget.product.price}",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      "About this item",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "• This pre-owned product is not Apple certified, but has been professionally inspected, tested and cleaned by Amazon-qualified suppliers.\n• There will be no visible cosmetic imperfections when held at an arm’s length. There will be no visible cosmetic imperfections when held at an arm’s length.\n• This product will have a battery which exceeds 80% capacity relative to new.Accessories will not be original, but will be compatible and fully functional. Product may come in generic Box.\n• This product is eligible for a replacement or refund within 90 days of receipt if you are not satisfied.",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Gap(100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
