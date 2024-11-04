import 'package:get/get.dart';
import 'package:list_data_getx/models/list_data_model.dart';
import 'package:list_data_getx/services/api_services.dart';

class UserController extends GetxController {
  var users = <ListDataModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUser();
  }

  void fetchUser() async {
    try {
      isLoading(true);
      var data = await ApiServices().getListData();
      users.value = data!;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
