import 'package:ebook/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/book.dart';
import '../../../utils/constants/text_strings.dart';

class BookDetail extends StatelessWidget{

  final Book book;
  const BookDetail(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('cat',
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold,
          ),
          ),
          const SizedBox(height: 10,),
          Text(book.name,
          style: const TextStyle(
            fontSize: 24,
            height: 1.2,
          ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: TTexts.writer,
                        style: TextStyle(
                            color: Colors.grey
                        )),
                    TextSpan(text: book.writer,
                        style: const TextStyle(
                          color: kFont,
                          fontWeight: FontWeight.bold,

                        )
                    )

                  ]
                )
              ),
              Text(
                DateFormat.yMMMd().format(book.publishedOn),
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}