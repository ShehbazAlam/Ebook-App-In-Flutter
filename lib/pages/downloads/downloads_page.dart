import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../commons/appbar/appbar.dart';
import '../search/search.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              MyAppBar(
                isCenterTitle: true,
                title: Text("ڈاؤن لوڈ", style: Theme.of(context).textTheme.headlineSmall,),
                leadingIcon:  Iconsax.search_normal,
                leadingOnPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const SearchPage())),
                actions: [
                  IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              Expanded(
                child: Container(),

              ),
            ],
          ),
        )
    );
  }
}
