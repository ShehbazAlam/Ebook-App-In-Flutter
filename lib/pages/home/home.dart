import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/pages/home/controllers/future_controller.dart';
import 'package:ebook/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../commons/appbar/drawer.dart';
import '../../commons/widgets/promo_slider.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/category_item.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});
  final FutureController controller = Get.put(FutureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTexts.homeAppbarSubTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(TTexts.homeAppbarTitle,
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Iconsax.notification))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: PromoSlider(),
            ),
            Padding(
              padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Obx(
                        () => Skeletonizer(
                          enabled: controller.enableSkeleton.value,
                          child: StaggeredGridView.countBuilder(
                                itemCount: controller.categoryList.length,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                crossAxisCount: 4,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                itemBuilder: (_, index) => CategoryItem(controller.categoryList[index]),
                                staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
                                          ),
                        )
              )
            )
          ],
        ),
      ),
    );
  }
}
