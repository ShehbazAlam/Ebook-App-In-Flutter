import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/pages/books/widgets/book_gridview.dart';
import 'package:ebook/pages/books/widgets/book_item.dart';
import 'package:ebook/pages/home/controllers/remote_controller.dart';
import 'package:ebook/utils/http/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebook/pages/search/search.dart';

import '../../models/book.dart';
import '../../models/categories.dart';


class BookListPage extends StatelessWidget {
  final Category category;
  BookListPage({super.key, required this.category});
  final DataController dataController = DataController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  MyAppBar(
          isCenterTitle: true,
          title: Text(category.name, style: Theme.of(context).textTheme.headlineSmall,),
          leadingIcon:  Iconsax.search_normal,
          leadingOnPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchPage())),
          actions: [
            IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child:dataController.isLoading == true ? const Center(
            child: CircularProgressIndicator(),
          ) : SingleChildScrollView(
                child: Obx(
                    ()=>StaggeredGridView.countBuilder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: dataController.dataList.length,
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder:(_, index) => dataController.dataList != null ? BookItem(dataController.dataList[index]) : Container(
                        child: const Center( child: Text("Nothing Found")),
                      ),
                      staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
                    )
                )
              ),

          ),

    );
  }
}
