import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import '../../../models/book.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';

class DataController extends GetxController {
  // final Category category;
  // DataController(this.category);
  var dataList = <Book>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    dataList.value = await fetchData(1) ;
  }

  Future<List<Book>> fetchData(int id) async {
    isLoading.value = true;
    var url = Uri.parse('http://localhost/ebook_api/api.php/category/$id');
    var response = await http.get(url);

    isLoading.value = false;

    if(response.statusCode == 200){
      List<dynamic> data = json.decode(response.body);
      List<Book> books = data.map((item) => Book.fromJson(item)).toList();
      return books;
    } else{
      throw Exception('API returned status code ${response.statusCode}');
    }
  }
}
