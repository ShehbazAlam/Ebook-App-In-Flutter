import 'package:ebook/models/book.dart';
import 'package:flutter/material.dart';

class BookContent extends StatelessWidget {
  final Book book;
  const BookContent(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Text(
      book.content,
    );
  }
}