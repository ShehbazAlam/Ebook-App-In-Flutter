import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/remote_controller.dart';

class HomePage extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx API Example'),
      ),
      body: Obx(
            () => dataController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: dataController.dataList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(dataController.dataList[index].name),
            );
          },
        ),
      ),
    );
  }
}
