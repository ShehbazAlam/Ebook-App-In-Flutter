import 'package:get/get.dart';

import '../../../models/categories.dart';
import '../../../utils/http/http_client.dart';

class FutureController extends GetxController{

  late Future<Category> categoryList;

  @override
  Future<void> onInit() async {
    super.onInit();
    categoryList =  (await THttpHelper.fetchCategory('/categories')) as Future<Category>;
  }
}