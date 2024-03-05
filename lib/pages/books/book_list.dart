import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/pages/books/widgets/book_gridview.dart';
import 'package:ebook/pages/books/widgets/book_item.dart';
import 'package:ebook/utils/http/http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ebook/pages/search/search.dart';

import '../../models/book.dart';
import '../../models/categories.dart';


class BookListPage extends StatefulWidget {
  final Category category;
  const BookListPage({super.key, required this.category});


  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage>{

  late Future<Book> bookList;
  late Category category;

  @override
  void initState(){
    this.initState();
    bookList = THttpHelper.fetchBooks('categories', category.id as int);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              MyAppBar(
                isCenterTitle: true,
                title: Text(category.name, style: Theme.of(context).textTheme.headlineSmall,),
                leadingIcon:  Iconsax.search_normal,
                leadingOnPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchPage())),
                actions: [
                  IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              Expanded(
                child: FutureBuilder<Book>(
                  future: bookList,
                  builder: (BuildContext context, AsyncSnapshot<Book> snapshot) {
                    if(snapshot.hasData){
                      return StaggeredGridView.countBuilder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        crossAxisCount: 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemBuilder:(_, index) => bookList != null ? BookItem(
                            snapshot.data
                        ) : Container(
                          child: const Center( child: Text("Nothing Found")),
                        ),
                        staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
                      );
                  }
                    else{
                      Text(snapshot.error.toString());
                    }
                    return const CircularProgressIndicator();
                  },

                )
              ),
            ],
          ),
        )
    );
  }
}
