import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/sizes.dart';

class MyMarkdownWidget extends StatelessWidget {
  final ScrollController controller;
  final String markdownData;

  const MyMarkdownWidget({super.key, required this.controller, required this.markdownData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SingleChildScrollView(
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MarkdownBody(
            data: markdownData,
            shrinkWrap: true,
            softLineBreak: true,

            onTapLink: (i, j, k) {
              launchUrl(Uri.parse(j ?? ""));
            },
          ),
        ),
      ),
    );
  }
}
