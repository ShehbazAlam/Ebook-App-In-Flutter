import 'package:ebook/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';


class BannerImage extends StatelessWidget {
  const BannerImage({
    super.key, required this.assetImage,
  });

  final String assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: TDeviceUtils.getScreenWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.md),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(TSizes.md),
        child: Image(
          image: AssetImage(assetImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
