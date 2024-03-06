import 'dart:convert';

import 'package:ebook/models/categories.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../../../models/book.dart';

class FutureController extends GetxController{
  var isLoading = false.obs;
  var categoryList = <Category>[].obs;

  @override
  void onInit() async {
    super.onInit();
    categoryList.value = await fetchData() ;
  }

  Future<List<Category>> fetchData() async {
    isLoading.value = true;
    var url = Uri.parse('http://localhost/ebook_api/api.php/categories');
    var response = await http.get(url);

    isLoading.value = false;

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<Category> categories = data.map((item) => Category.fromJson(item)).toList();
      return categories;
    } else{
      throw Exception('API returned status code ${response.statusCode}');
    }
  }
}
