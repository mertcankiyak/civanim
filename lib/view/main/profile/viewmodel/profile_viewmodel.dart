import 'package:civanim/locator.dart';
import 'package:civanim/view/main/profile/base/profile_base.dart';
import 'package:civanim/view/main/profile/model/profile_model.dart';
import 'package:civanim/view/main/profile/service/profile_service.dart';
import 'package:flutter/cupertino.dart';

class ProfileViewModel with ChangeNotifier implements ProfileBASE{

  ProfileService _profileService = locator<ProfileService>();
  @override
  Future<bool> profileUpdate({required ProfileModel guncellecekProfil}) async {
    try{
      return await _profileService.profileUpdate(guncellecekProfil: guncellecekProfil);
    }catch(e){
      throw "profileUpdate Hata: "+ e.toString();
    }
  }


}