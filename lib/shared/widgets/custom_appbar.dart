import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 2,
      backgroundColor: AppColors.whiteColor,
      automaticallyImplyLeading: false,
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
