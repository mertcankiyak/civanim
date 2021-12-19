import 'package:civanim/locator.dart';
import 'package:civanim/view/authenticate/login/base/login_base.dart';
import 'package:civanim/view/authenticate/login/model/login_model.dart';
import 'package:civanim/view/authenticate/login/service/login_service.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';
import 'package:flutter/cupertino.dart';

enum AuthState{BOSTA,DOLU}

class LoginViewModel with ChangeNotifier implements LoginBASE{

  LoginViewModel(){
    currentUser().then((value) {
      if(value.email != null){
        girisYapmisKullaniciBilgileriniCek(email: value.email!);
      }
    });
  }
  LoginService _loginService = locator<LoginService>();

  AuthState _authState = AuthState.BOSTA;
  LoginModel? _loginModel = LoginModel(email: null, id: null);
  RegisterFirestoreModel _registerFirestoreModel = RegisterFirestoreModel(name: null, surname: null, email: null, birthday: null, id: null);

  LoginModel? get loginModel => _loginModel;

  set loginModel(LoginModel? value){
    _loginModel = value;
    notifyListeners();
  }

  AuthState get authState => _authState;

  set authState(AuthState value) {
    _authState = value;
    notifyListeners();
  }


  RegisterFirestoreModel get registerFirestoreModel => _registerFirestoreModel;

  set registerFirestoreModel(RegisterFirestoreModel value) {
    _registerFirestoreModel = value;
    notifyListeners();
  }

  @override
  Future<LoginModel> loginWithEmail({required String email, required String password}) async {
    try{
      authState = AuthState.DOLU;
      loginModel = await _loginService.loginWithEmail(email: email, password: password);
      return loginModel!;
    }catch(e){
      throw "loginWithEmail Hata: "+ e.toString();
    }finally{
      authState = AuthState.BOSTA;
    }
  }

  @override
  Future<LoginModel> currentUser() async {
    try{
      authState = AuthState.DOLU;
      loginModel = await _loginService.currentUser();
      return loginModel!;
    }catch(e){
      throw "currentUser Hata: "+ e.toString();
    }finally{
      authState = AuthState.BOSTA;
    }
  }

  @override
  Future<LoginModel> signOut() async {
    try{
      authState = AuthState.DOLU;
      loginModel = await _loginService.signOut();
      return loginModel!;
    }catch(e){
      throw "LoginModel Hata: "+ e.toString();
    }finally{
      authState = AuthState.BOSTA;
    }
  }

  @override
  Future<RegisterFirestoreModel> girisYapmisKullaniciBilgileriniCek({required String email}) async {
    try{
       registerFirestoreModel = await _loginService.girisYapmisKullaniciBilgileriniCek(email: email);
       return registerFirestoreModel;
    }catch(e){
      throw "girisYapmisKullaniciBilgileriniCek Hata: "+ e.toString();
    }
  }


}