import 'package:alphatwelve/core/colors/app_colors.dart';
import 'package:alphatwelve/features/home/presentation/controllers/home_controller.dart';
import 'package:alphatwelve/features/home/presentation/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chevron_left_rounded),
              ),
              Text(
                "Technology",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          //   const  Gap(8),
          Divider(color: AppColors.dividerColor, height: 1),
          Gap(12),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Smartphones, Laptops &\nAccessories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Gap(12),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemCount: ref.watch(homeProvider).products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = ref.watch(homeProvider).products[index];
                return ProductCard(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
