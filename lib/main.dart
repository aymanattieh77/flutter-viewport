import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/services/theme_services.dart';

import 'ui/pages/home_page.dart';
import 'ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'todo Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
    );
  }
}
