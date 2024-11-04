import 'dart:convert';

import 'package:get/get.dart';
import 'package:list_data_getx/models/list_data_model.dart';

class ApiServices extends GetConnect {
  static const String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<ListDataModel>?> getListData() async {
    final response = await get(url);

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map(
            (e) => ListDataModel.fromJson(e),
          )
          .toList();
    } else {
      throw Exception("Failed to load users");
    }
  }
}
