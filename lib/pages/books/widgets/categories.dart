import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;

  CustomTab(this.selected, this.callback, {super.key});
  final tabs =["Ebooks", "AudioBooks", "Books"];


  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 80,
      child: ListView.builder(
        itemCount: tabs.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: ()=> callback(index),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 30,
              width: 150.0,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: const Color(0xffD0D0D0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      tabs[index],
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            ),
        ),
      ) 
    );
  }
}