import 'package:behesht_services/view/home_page/with_database/home_page_database.dart';
import 'package:behesht_services/view/home_page/with_network/home_page_network.dart';
import 'package:behesht_services/view/service_details.dart';
import 'package:get/get.dart';

class Routes{
  static List<GetPage> get pages => [
    GetPage(name: '/homePageNetwork', page: ()=>  const HomePageNetwork()),
    GetPage(name: '/homePageDatabase', page: ()=>  const HomePageDatabase()),
    GetPage(name: '/serviceDetails', page: ()=> ServiceDetails(
      id: Get.arguments['id'],
      name: Get.arguments['name'],
      description: Get.arguments['description'],
      minQty: Get.arguments['minQty'],
      maxQty: Get.arguments['maxQty'],
      price: Get.arguments['price'],
      serviceId: Get.arguments['serviceId'],),
    ),
  ];
}