import 'package:ebook/pages/home/controllers/home_controllers.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import 'banner.dart';
import 'circular_container.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: const [
            BannerImage(assetImage: TImages.promoBanner2),
            BannerImage(assetImage: TImages.promoBanner1,),
            BannerImage(assetImage: TImages.promoBanner3,),
          ],

          options: CarouselOptions(
              viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
        Center(
          child: Obx(
            ()=> Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i = 0; i <3; i++)  CircularContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                  radius: 20,
                  margin: const EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
