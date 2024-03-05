import 'package:ebook/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/sizes.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.title, this.showBackArrow = false, this.leadingIcon, this.actions, this.leadingOnPressed, this.isCenterTitle = false});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final bool isCenterTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AppBar(
          automaticallyImplyLeading: true,
          leading: showBackArrow ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_ios)) : leadingIcon !=null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon)) : null,
          title: title,
          actions: actions,
          centerTitle: isCenterTitle,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
