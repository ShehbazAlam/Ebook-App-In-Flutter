import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/pages/books/widgets/book_item.dart';
import 'package:ebook/pages/home/controllers/remote_controller.dart';
import 'package:ebook/pages/home/home.dart';
import 'package:ebook/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebook/pages/search/search.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../models/categories.dart';


class BookListPage extends StatelessWidget {
  final Category category;
  const BookListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    final DataController dataController = Get.put(DataController(category));
    // dataController.onInit();

    return Scaffold(
        appBar:  MyAppBar(
          isCenterTitle: true,
          title: Text(category.name, style: Theme.of(context).textTheme.headlineSmall,),
          leadingIcon:  Iconsax.search_normal,
          leadingOnPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchPage())),
          actions: [
            IconButton(onPressed: () {
              Get.delete<DataController>();
              Get.back();
              }, icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child:Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: SingleChildScrollView(
                  child: Obx(
                      ()=>Skeletonizer(
                        enabled: dataController.enableSkeleton.value,
                        child: StaggeredGridView.countBuilder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: dataController.dataList.length,
                          crossAxisCount: 4,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          itemBuilder:(_, index) => BookItem(dataController.dataList[index]),
                          staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
                        ),
                      )
                  )
                ),
          ),

          ),

    );
  }
}
