import 'dart:convert';

import 'package:ebook/models/categories.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import 'package:ebook/utils/constants/api_constants.dart';


class FutureController extends GetxController{
  var isLoading = false.obs;
  var categoryList = <Category>[].obs;
  var enableSkeleton = true.obs;

  @override
  void onInit() async {
    super.onInit();
    categoryList.value = await fetchData() ;
    autoUpdate();
  }

  Future<List<Category>> fetchData() async {
    isLoading.value = true;
    var url = Uri.parse('$baseUrl/$categoryEndpoint');
    var response = await http.get(url, headers: {"Accept": "application/json"});

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<Category> categories = data.map((item) => Category.fromJson(item)).toList();
      isLoading.value = false;
      return categories;
    } else{
      throw Exception('API returned status code ${response.statusCode}');
    }
  }

  void autoUpdate(){
    Future.delayed(const Duration(seconds: 3), (){
      enableSkeleton.value = false;
    });
  }
}
