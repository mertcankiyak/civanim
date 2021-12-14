import 'package:civanim/locator.dart';
import 'package:civanim/view/main/home/base/service_base.dart';
import 'package:civanim/view/main/home/model/service_model.dart';
import 'package:civanim/view/main/home/services/services_service.dart';
import 'package:flutter/material.dart';

class ServicesViewModel with ChangeNotifier implements ServiceBase{

  ServicesService _servicesService = locator<ServicesService>();

  @override
  Future<List<ServiceModel>> getServiceList() async{
    try{
      return await _servicesService.getServiceList();
    }catch(e){
      throw "getServiceList Hata: "+ e.toString();
    }
  }

}