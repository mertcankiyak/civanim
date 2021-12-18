import 'package:civanim/core/constants/strings.dart';
import 'package:civanim/core/extensions/string_extensions.dart';
class AuthenticateValidationMixin {

  String? validateEmail(String? value) {
    value!.emailValid == true ? null : gecersizEmail;
  }

  String? validatePassword(String? value) {
    value!.length>6 ? null : sifreKarakterSiniri;
  }
}