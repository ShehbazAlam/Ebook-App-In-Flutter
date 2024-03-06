import 'package:flutter/material.dart';

import '../../../models/book.dart';

class BookReview extends StatelessWidget {
  final Book book;
  const BookReview(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 15,),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: book.discreption,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.8
                  )
                ),

              ]
            )
          )
        ],
      ),
    );
  }
}
