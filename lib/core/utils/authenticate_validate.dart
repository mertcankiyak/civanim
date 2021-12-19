import 'package:civanim/core/constants/strings.dart';
import 'package:civanim/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
class AuthenticateValidationMixin {

  String? lengthControl(String? value) {
    debugPrint("email kontrol kısmına gelindi");
    if(value!.length>0) {
      return null;
    }else{
      return bosGecilemez;
    }
  }

  String? validateEmail(String? value) {
    debugPrint("email kontrol kısmına gelindi");
    if(value!.emailValid==true) {
      return null;
    }else{
      return gecersizEmail;
    }
  }

  String? validatePassword(String? value) {

    if(value!.length>5) {
      return null;
    }else{
      return sifreKarakterSiniri;
    }
  }
}