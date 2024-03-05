import 'package:ebook/pages/downloads/downloads_page.dart';
import 'package:ebook/pages/home/home.dart';
import 'package:ebook/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index)=> controller.selectedIndex.value = index,
          destinations: const[
            NavigationDestination(icon: Icon(Iconsax.home), label: "ہوم"),
            NavigationDestination(icon: Icon(Iconsax.search_normal), label: "تلاش کریں۔"),
            NavigationDestination(icon: Icon(Iconsax.document_download), label: "ڈاؤن لوڈ"),
          ],

        ),
      ),

      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomePage(),
    const SearchPage(),
    const DownloadsPage(),
  ];
}