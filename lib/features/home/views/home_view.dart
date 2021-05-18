import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:todoapp/features/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final TextEditingController todoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: controller.isBusy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.hasError
                      ? Center(
                          child: Text(controller.error),
                        )
                      : ListView.builder(
                          itemCount: controller.photos.length,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Image.network(controller.photos[index].url),
                                  SizedBox(height: 8),
                                  Text(controller.photos[index].title),
                                  SizedBox(height: 8),
                                ],
                              )),
            ),
          );
        });
  }
}
