import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/models/book.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_html/flutter_html.dart';


import '../../utils/constants/fonts.dart';

class BookReading extends StatelessWidget {
  final Book book;
  const BookReading(this.book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: MyAppBar(
         isCenterTitle: true,
         title: Text(book.name, style: const TextStyle(
           fontFamily: TFonts.appFont,
         ), ),
         actions: [
           IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: const Icon(Icons.arrow_forward_ios))
         ],
         leadingIcon: Iconsax.bookmark,
         leadingOnPressed: (){}
       ),

        body: Html(
           data: """
           
            <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="#">About</a>
  <a href="#">Services</a>
  <a href="#">Clients</a>
  <a href="#">Contact</a>
</div>

<!-- Use any element to open the sidenav -->
<span onclick="openNav()">open</span>

<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
<div id="main">
  ...
</div> 
           </body>
           
           """,
        )
    );
  }

}

