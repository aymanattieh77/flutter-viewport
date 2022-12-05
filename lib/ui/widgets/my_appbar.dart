import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget myAppbar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    title: const Text(''),
    centerTitle: true,
    foregroundColor: Get.isDarkMode ? Colors.white : Colors.black,
    backgroundColor: Theme.of(context).backgroundColor,
    actions: const [
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/person.jpeg'),
        radius: 18,
      ),
      SizedBox(width: 20.0),
    ],
  );
}
