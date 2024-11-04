import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_data_getx/controllers/user_controller.dart';

class ShowData extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data Api"),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (userController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: userController.users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(userController.users[index].id.toString()),
                      ),
                      title: Text(
                        userController.users[index].title.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(userController.users[index].body.toString()),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
