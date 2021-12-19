import 'package:civanim/view/authenticate/login/model/login_model.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';

abstract class LoginBASE{
  Future<LoginModel> loginWithEmail({required String email,required String password});
  Future<RegisterFirestoreModel> girisYapmisKullaniciBilgileriniCek({required String email});
  Future<LoginModel> currentUser();
  Future<LoginModel> signOut();
}