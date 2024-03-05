import 'package:ebook/commons/widgets/banner.dart';
import 'package:ebook/utils/constants/image_strings.dart';
import 'package:ebook/utils/device/device_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/text_strings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child:ListView(
            children: [
              Column(
                children: [
                  Image(
                   image: AssetImage(TImages.promoBanner1),
                    width: TDeviceUtils.getScreenWidth(context),
                  ),
                  Text(TTexts.appName, style: Theme.of(context).textTheme.headlineMedium,)
                ]
              ),
              ListTile(
                leading: const Icon(Iconsax.star),
                title: const Text(' ایپ کی درجہ بندی کریں۔ '),
                onTap: () {
                },
              ),
              ListTile(
                leading: const Icon(Iconsax.share),
                title: const Text(' ایپ شیئر کریں۔ '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Iconsax.info_circle),
                title: const Text(' ایپ کے بارے میں '),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Iconsax.code),
                title: const Text(' ڈویلپر کے بارے میں '),
                onTap: () {},
              ),
            ],
          )


    );
  }
}
