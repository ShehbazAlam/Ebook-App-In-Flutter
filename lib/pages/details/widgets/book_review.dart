import 'package:ebook/constants/colors.dart';
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

  Widget _buildStar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.grey.withOpacity(0.6),
    ];
    return Row(
      children: color.map((e) => Icon(Icons.star, size: 25, color: e)).toList(),
    );
  }
}
