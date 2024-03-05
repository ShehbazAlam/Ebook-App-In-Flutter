import 'package:ebook/commons/appbar/appbar.dart';
import 'package:ebook/utils/constants/text_strings.dart';
import 'package:ebook/utils/http/http_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import 'package:http/http.dart' as http;

import '../../commons/appbar/drawer.dart';
import '../../commons/widgets/promo_slider.dart';
import '../../models/categories.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/category_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();

}
class _HomePageState extends State<HomePage>{

  late Future<Category> categoryList;

  @override
  void initState(){
    this.initState();
    getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyAppBar(

              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall,),
                  Text(TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
              actions: [
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.notification))
              ],
            ),

            const Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: PromoSlider(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Text("Hrllo"),
            ),
          ],
        ),
      ),
    );
  }

  void getCategories() async {
    categoryList =  (await THttpHelper.fetchCategory('/categories')) as Future<Category>;

  }
}