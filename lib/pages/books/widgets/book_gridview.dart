import 'package:ebook/pages/books/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:ebook/models/book.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class BookGridView extends StatelessWidget{

  BookGridView({super.key});

  @override
  Widget build(BuildContext context){

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: PageView(
        children: [


        ],
      ),
    );
  }
}