import 'package:behesht_services/routes/routes.dart';
import 'package:behesht_services/view/home_page/with_database/home_page_database.dart';
import 'package:behesht_services/view/home_page/with_network/home_page_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:get/get.dart';

import 'binding/bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return InternetWidget(
      offline: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: Routes.pages,
        initialBinding: MyBindings(),
        initialRoute: '/homePageDatabase',
        home: const HomePageDatabase(),
      ),
      online: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        getPages: Routes.pages,
        initialBinding: MyBindings(),
        initialRoute: '/homePageNetwork',
        home: const HomePageNetwork(),
      ),
    );
  }
}
