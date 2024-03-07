import 'dart:convert';

import 'package:get/get.dart';
import '../../../models/book.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:ebook/utils/constants/api_constants.dart';

import '../../../models/categories.dart';

class DataController extends GetxController {
  final Category category;
  DataController(this.category);
  var dataList = <Book>[].obs;
  var isLoading = false.obs;
  var enableSkeleton = true.obs;

  @override
  void onInit() async {
    super.onInit();
    dataList.value = await fetchData(category.id) ;
    autoUpdate();
  }

  Future<List<Book>> fetchData(int id) async {
    isLoading.value = false;
    var url = Uri.parse('$baseUrl/$bookByCategoryEndpoint/$id');
    var response = await http.get(url);

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<Book> books = data.map((item) => Book.fromJson(item)).toList();
      isLoading.value = false;
      return books;
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
