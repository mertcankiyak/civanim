import 'package:civanim/view/authenticate/login/service/login_service.dart';
import 'package:civanim/view/authenticate/register/service/register_service.dart';
import 'package:civanim/view/main/article/service/article_service.dart';
import 'package:civanim/view/main/corona/service/corona_service.dart';
import 'package:civanim/view/main/home/services/doctors_service.dart';
import 'package:civanim/view/main/home/services/services_service.dart';
import 'package:civanim/view/main/profile/service/profile_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

setupLocator(){
  locator.registerLazySingleton(() => ServicesService());
  locator.registerLazySingleton(() => DoctorsService());
  locator.registerLazySingleton(() => ArticleService());
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => CoronaService());
  locator.registerLazySingleton(() => ProfileService());
}