import 'package:civanim/view/main/home/services/services_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

setupLocator(){
  locator.registerLazySingleton(() => ServicesService());
}