import 'package:civanim/view/authenticate/login/view/login_page.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/main/home/view/bottom_navigation.dart';
import 'package:provider/provider.dart';
import 'package:civanim/view/main/home/view/home_page.dart';
import 'package:flutter/material.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<LoginViewModel>(context);
    if(_authViewModel.authState == AuthState.BOSTA){
      if(_authViewModel.loginModel!.email == null){
        return LoginPage();
      }else{
        return BottomNavigation();
      }
    }else{
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
