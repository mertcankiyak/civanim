import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterFirestoreModel{
  String? name;
  String? surname;
  String? email;
  Timestamp? birthday;
  String? id;

  RegisterFirestoreModel({required this.name,required this.surname,required this.email,required this.birthday,required this.id});

  RegisterFirestoreModel.fromMap(Map<String, dynamic> gelenMap):
        name = gelenMap["kullanici_adi"],
        surname = gelenMap["kullanici_soyadi"],
        email = gelenMap["kullanici_email"],
        id = gelenMap["kullanici_id"],
        birthday = gelenMap["kullanici_dt"];

  Map<String, dynamic> toMap(){
    return{
      'kullanici_adi':name,
      'kullanici_soyadi':surname,
      'kullanici_email':email,
      'kullanici_id':id,
      'kullanici_dt':birthday,
    };
  }


}