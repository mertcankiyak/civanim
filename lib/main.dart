import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/core/utils/globals.dart';
import 'package:civanim/locator.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:civanim/view/landing/view/landing_page.dart';
import 'package:civanim/view/main/article/viewmodel/article_viewmodel.dart';
import 'package:civanim/view/main/chat/viewmodel/chat_viewmodel.dart';
import 'package:civanim/view/main/corona/viewmodel/corona_viewmodel.dart';
import 'package:civanim/view/main/home/viewmodel/doctors_viewmodel.dart';
import 'package:civanim/view/main/home/viewmodel/services_viewmodel.dart';
import 'package:civanim/view/main/profile/viewmodel/profile_viewmodel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: ConstantColors.softBlackColor, // navigation bar color
    statusBarColor: ConstantColors.bodyColor, // status bar color
    statusBarBrightness: Brightness.light,//status bar brigtness
    statusBarIconBrightness:Brightness.dark , //status barIcon Brightness
    systemNavigationBarIconBrightness: Brightness.light, //navigation bar icon
  ));
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeNotifier>(
          create: (context)=>ThemeNotifier(lightTheme),
        ),
        ChangeNotifierProvider<ServicesViewModel>(
          create: (context)=>ServicesViewModel(),
        ),
        ChangeNotifierProvider<DoctorsViewModel>(
          create: (context)=>DoctorsViewModel(),
        ),
        ChangeNotifierProvider<ArticleViewModel>(
          create: (context)=>ArticleViewModel(),
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context)=>LoginViewModel(),
        ),
        ChangeNotifierProvider<RegisterViewModel>(
          create: (context)=>RegisterViewModel(),
        ),
        ChangeNotifierProvider<CoronaViewModel>(
          create: (context)=>CoronaViewModel(),
        ),
        ChangeNotifierProvider<ProfileViewModel>(
          create: (context)=>ProfileViewModel(),
        ),
        ChangeNotifierProvider<ChatViewModel>(
          create: (context)=>ChatViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Civan??m',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          primaryColor: ConstantColors.softOrangeColor,
        ),
        home: MyFirstPage(),
      ),
    );
  }
}

class MyFirstPage extends StatelessWidget {

 // ThemeNotifier tema = ThemeNotifier();
  @override
  Widget build(BuildContext context) {

    //tema.customTheme.themeData.textTheme.headline1;
    return LandingPage();
  }
}


