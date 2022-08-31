import 'dart:convert';
import 'dart:developer';

import 'package:behesht_services/model/get_all_services_Items_model.dart';
import 'package:behesht_services/model/save_to_database_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController{

  final String _baseUrl = 'https://ebehesht.tehran.ir:8080/api/v1';
  final String apiKey = 'F63CD7B1-EEDA-5D85-AAB1-B643E3E1D032';
  ServicesAllItemModel? servicesAllItemModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getApi();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  getApi() async {
    try{
      isDataLoading(true);
      http.Response response = await http.get(
          Uri.tryParse('$_baseUrl/Service/GetAllItems/')!,
          headers: {'APIKey': apiKey}
      );
      if(response.statusCode == 200){
        ///data successfully

        var result = jsonDecode(response.body);

        servicesAllItemModel =  ServicesAllItemModel.fromJson(result);
      }else{
        ///error
      }
    }catch(e){
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }
}

