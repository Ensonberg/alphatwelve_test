import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:alphatwelve/core/extensions/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomButton extends ConsumerWidget {
  final VoidCallback onTap;
  final String title;

  const CustomButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colorScheme.primary,
      ),
      child: RawMaterialButton(
        onPressed: onTap,

        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
          ),
        ),
      ),
    );
  }
}
