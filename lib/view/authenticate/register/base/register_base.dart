import 'package:civanim/view/authenticate/register/model/register_base.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';

abstract class RegisterBASE{
  Future<RegisterModel> signUpWithEmail({required String email,required String password});
  Future<bool> firestoreAddUser({required RegisterFirestoreModel model});
}