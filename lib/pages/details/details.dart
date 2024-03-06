import 'package:ebook/pages/details/read_book.dart';
import 'package:ebook/pages/details/widgets/book_cover.dart';
import 'package:ebook/pages/details/widgets/book_detail.dart';
import 'package:ebook/pages/details/widgets/book_review.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../models/book.dart';
import '../../utils/constants/fonts.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class DetailPage extends StatelessWidget{
  final Book book;

  const DetailPage(this.book, {super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildAppBar(context),
        body: Directionality( // add this
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Column(
              children: [
                BookDetail(book),
                BookCover(book),
                BookReview(book),
                SizedBox(
                    width: MediaQuery.of(context).size.width - 40,

                   child: ElevatedButton(
                      onPressed: ()=> Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BookReading(book))
                      ),
                      child: const Text(TTexts.readBook,
                        style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                            fontFamily: TFonts.appFont
                      ),
                      )
                ),
              ),
                const SizedBox(height: TSizes.spaceBtwSections)

          ]
        ),
      )
        )
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return AppBar(
      backgroundColor: dark ? Colors.black12 : Colors.white,
      elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios,)),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.more_horiz_outlined, color: dark ? Colors.white : kFont,)),

      ],
    );
  }
}