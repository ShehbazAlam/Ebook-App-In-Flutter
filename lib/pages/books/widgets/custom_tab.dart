import 'package:flutter/material.dart';
import 'package:ebook/constants/colors.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;

  CustomTab(this.selected, this.callback, {super.key});
  final tabs =["تفسیر", "ترجمہ", "سیرت", "احادیث"];


  @override
  Widget build(BuildContext context){
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(5)
      ),
      width: width,
      height: 56,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        itemBuilder: (_, index) => GestureDetector(
          onTap: ()=> callback(index),
          child: Container(
            decoration: BoxDecoration(
              color: selected == index ? Colors.white : Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            width: (width - 40)/3 -10,
            child: Text(
              tabs[index],
              style: const TextStyle(
                color: kFont,
                fontWeight: FontWeight.w500,
              ),
            ),
            ),
        ),
        itemCount: tabs.length
        )
    );
  }
}