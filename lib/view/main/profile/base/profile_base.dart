import 'package:civanim/view/main/profile/model/profile_model.dart';

abstract class ProfileBASE{

  Future<bool> profileUpdate({required ProfileModel guncellecekProfil});
}