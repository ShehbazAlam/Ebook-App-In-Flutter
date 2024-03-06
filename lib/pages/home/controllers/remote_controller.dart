import 'dart:convert';

import 'package:get/get.dart';
import '../../../models/book.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';

import '../../../models/categories.dart';

class DataController extends GetxController {
  final Category category;
  DataController(this.category);
  var dataList = <Book>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    dataList.value = await fetchData(category.id) ;
  }


  Future<List<Book>> fetchData(int id) async {
    isLoading.value = false;
    var url = Uri.parse('http://localhost/ebook_api/api.php/category/$id');
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
}
