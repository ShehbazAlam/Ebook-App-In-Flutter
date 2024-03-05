import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: SearchBar(
        leading: Icon(Icons.search),
        autoFocus: true,

      )
    );
  }
}