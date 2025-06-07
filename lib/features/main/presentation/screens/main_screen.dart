import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:alphatwelve/features/main/presentation/controllers/main_controller.dart';
import 'package:alphatwelve/features/main/presentation/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerStatefulWidget {
  final Widget child;

  const MainScreen({super.key, required this.child});

  @override
  ConsumerState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var mainController = ref.watch(mainProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: Colors.transparent,
        // toolbarHeight: 90,
        title: Column(
          children: [
            Text(
              context.tr.delivery_address,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600),
            ),
            Gap(8),
            Text(
              context.tr.delivery_address_details,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/svgs/notification_icon.svg"),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE2E8F0)),

                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(8),
                        SvgPicture.asset(
                          "assets/svgs/search.svg",
                          height: 14.h,
                          width: 14.w,
                          fit: BoxFit.cover,
                        ),
                        const Gap(8),
                      ],
                    ),
                    contentPadding: EdgeInsets.zero,

                    hintText: "Search...",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Color(0xffCBD5E1),
                    ),

                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),

          Gap(8),
          Divider(),

          Expanded(child: widget.child),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 2,
        child: SizedBox(
          height: 80.h,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavItem(
                  onTap: () {
                    mainController.onTap(context, 0);
                  },
                  title: context.tr.home,
                  asset: "assets/svgs/home_icon.svg",
                  currentIndex: mainController.currentIndex == 0,
                ),
                BottomNavItem(
                  onTap: () {
                    mainController.onTap(context, 1);
                  },
                  title: context.tr.cart,
                  asset: "assets/svgs/cart_icon.svg",
                  isCart: true,
                  currentIndex: mainController.currentIndex == 1,
                ),
                BottomNavItem(
                  onTap: () {},
                  title: context.tr.favorites,
                  asset: "assets/svgs/favorite_unselected_icon.svg",
                  currentIndex: mainController.currentIndex == 2,
                ),
                BottomNavItem(
                  onTap: () {},
                  title: context.tr.profile,
                  asset: "assets/svgs/profile_icon.svg",
                  currentIndex: mainController.currentIndex == 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
