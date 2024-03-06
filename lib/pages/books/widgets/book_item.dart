import 'package:ebook/models/book.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../../details/details.dart';

class BookItem extends StatelessWidget {

  final Book? book;
  const BookItem(this.book, {super.key});

  @override 
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(book!))
          ),
      child: Stack(
        children: [

          Container(
            height: book!.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(book!.banner),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15)
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black.withOpacity(0.5), Colors.black, Colors.black, Colors.black]),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: TSizes.md,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(book!.name, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white), maxLines: 2, overflow: TextOverflow.ellipsis,),
                  ),
                  const SizedBox(height: TSizes.md,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(book!.writer, style:  Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.amber)),
                  ),
                  const SizedBox(height: TSizes.xs,),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}