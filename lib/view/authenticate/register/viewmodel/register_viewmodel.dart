import 'package:civanim/locator.dart';
import 'package:civanim/view/authenticate/register/base/register_base.dart';
import 'package:civanim/view/authenticate/register/model/register_base.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';
import 'package:civanim/view/authenticate/register/service/register_service.dart';
import 'package:flutter/cupertino.dart';

class RegisterViewModel with ChangeNotifier implements RegisterBASE{

  RegisterService _registerService = locator<RegisterService>();

  @override
  Future<RegisterModel> signUpWithEmail({required String email, required String password}) async {
    try{
      return await _registerService.signUpWithEmail(email: email, password: password);
    }catch(e){
      throw "signUpWithEmail Hata: "+ e.toString();
    }
  }

  @override
  Future<bool> firestoreAddUser({required RegisterFirestoreModel model}) async {
    try{
      return await _registerService.firestoreAddUser(model: model);
    }catch(e){
      throw "firestoreAddUser Hata: "+ e.toString();
    }
  }

}