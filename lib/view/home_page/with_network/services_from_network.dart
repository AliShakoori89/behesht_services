import 'package:behesht_services/constant/top_carousel.dart';
import 'package:behesht_services/controllers/service_controller.dart';
import 'package:behesht_services/model/get_all_services_Items_model.dart';
import 'package:behesht_services/model/save_to_database_model.dart';
import 'package:behesht_services/presentation/my_flutter_app_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../presentation/google_icons.dart';

class ServicesFromNetwork extends StatefulWidget {
  const ServicesFromNetwork({Key? key}) : super(key: key);

  @override
  State<ServicesFromNetwork> createState() => _ServicesFromNetworkState();
}

class _ServicesFromNetworkState extends State<ServicesFromNetwork> {

  final ScrollController _scrollController = ScrollController();
  bool? _isFirstRun;
  List allNames = [];
  ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        title: const Text("درخواست آنلاین خدمات بهشت زهرا(س)",
            style: TextStyle(fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              MyFlutterApp.panorama_wide_angle, color: Colors.black54,),
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Google.basket, color: Colors.black54),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        backgroundColor: Colors.green,
        label: const Text(
          'رزرو مراسم', style: TextStyle(fontWeight: FontWeight.w700),),
      ),
      body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TopCarousel(),
            const SizedBox(
              height: 20,
            ),
            Obx(() => serviceController.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : serviceController.servicesAllItemModel!.data!.isNotEmpty
                    ? Expanded(
                        child: GridView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 2 / 2.5,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: serviceController
                                .servicesAllItemModel!.data!.length,
                            itemBuilder: (BuildContext ctx, index) {
                              late ServicesDataBaseModel service =
                                  ServicesDataBaseModel();

                              service.name = serviceController
                                  .servicesAllItemModel!.data![index].name;
                              service.id = serviceController
                                  .servicesAllItemModel!.data![index].serviceId;
                              service.description = serviceController
                                  .servicesAllItemModel!.data![index].description;
                              service.maxQty = serviceController
                                  .servicesAllItemModel!.data![index].maxQty;
                              service.minQty = serviceController
                                  .servicesAllItemModel!.data![index].minQty;
                              service.price = serviceController
                                  .servicesAllItemModel!.data![index].price;
                              service.serviceId = serviceController
                                  .servicesAllItemModel!.data![index].serviceId;

                              if (_isFirstRun == true) {
                                Get.find<ServiceController>()
                                    .servicesAllItemModel!.add(
                                  service
                                );
                              }
                              allNames.add(service.name);

                              if (allNames.length ==
                                  serviceController
                                      .servicesAllItemModel!.data!.length) {
                                _isFirstRun = false;
                              }

                              CachedNetworkImage(
                                imageUrl: 'https://ebehesht.'
                                    'tehran.ir:8080/api/v1/Service'
                                    '/item/${serviceController.servicesAllItemModel!.data![index].serviceId}/image',
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              );

                              return InkWell(
                                onTap: () {
                                  Get.toNamed('/serviceDetails', arguments: {
                                    'id': serviceController
                                        .servicesAllItemModel!.data![index].id,
                                    'name': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .name,
                                    'description': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .description,
                                    'minQty': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .minQty,
                                    'maxQty': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .maxQty,
                                    'price': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .price,
                                    'serviceId': serviceController
                                        .servicesAllItemModel!
                                        .data![index]
                                        .serviceId,
                                  });
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 200,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: CachedNetworkImageProvider(
                                                    'https://ebehesht.tehran.ir:8080/'
                                                    'api/v1/Service/item/'
                                                    '${serviceController.servicesAllItemModel!.data![index].serviceId}/image'))),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      '${serviceController.servicesAllItemModel!.data![index].name}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ],
                                ),
                              );
                            }),
                      )
                    : const Center(
                        child: Text(
                            '!!برتامه برای اجرا اول نیاز به اینترنت دارد',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 19)),
                      ))
          ],
        ));
  }
}