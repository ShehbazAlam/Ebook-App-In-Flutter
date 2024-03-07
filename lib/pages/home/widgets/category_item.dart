import 'package:ebook/pages/books/book_list.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../models/categories.dart';

class CategoryItem extends StatelessWidget {

  final Category category;
  const CategoryItem(this.category, {super.key});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => BookListPage(category: category))
        ),
        child: Stack(
          children: [
            Container(
              height: category.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(category.backImg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                children: [
                  Icon(MdiIcons.fromString(category.icon), size: 46, color: Colors.white,),
                  Text(category.name, style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),)
                ],
              ),
            )
          ]

        )
    );
  }
}