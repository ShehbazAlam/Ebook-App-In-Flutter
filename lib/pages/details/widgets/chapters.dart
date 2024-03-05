import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ChaptersList extends StatelessWidget {
  const ChaptersList({super.key, required this.controller, required this.chapters, });

  final AutoScrollController controller;
  final List chapters;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        semanticLabel: "موضوع",
        child: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(chapters[index]["title"]),
              onTap: () {
                // Scroll to the corresponding chapter
                controller.scrollToIndex(index,
                    preferPosition: AutoScrollPosition.begin);
                Navigator.pop(context); // Close the drawer
              },
            );
          },
        ),
      ),
    );
  }
}
