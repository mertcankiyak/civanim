import 'package:civanim/view/main/home/model/service_model.dart';

abstract class ServiceBase{
  Future<List<ServiceModel>> getServiceList();
}