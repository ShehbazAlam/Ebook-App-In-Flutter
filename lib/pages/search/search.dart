import 'package:ebook/pages/search/widgets/search_bar.dart';
import 'package:ebook/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: TDeviceUtils.getAppBarHeight(),
          right: TSizes.defaultSpace,
          left: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace,
        ),
        child: Column(
          children: [
            const CustomSearchBar(),
            Container()
          ],
        ),
      ),
    );
  }
}
