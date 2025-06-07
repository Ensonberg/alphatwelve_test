import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActionButtonWidget extends ConsumerWidget {
  final VoidCallback onTap;
  final String asset;
  final Color iconColor;
  final Color color;

  const ActionButtonWidget({
    super.key,
    required this.onTap,
    required this.asset,
    required this.color,
    this.iconColor = AppColors.grey700Color,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        height: 36.h,
        width: 36.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(asset, color: iconColor),
        ),
      ),
    );
  }
}
