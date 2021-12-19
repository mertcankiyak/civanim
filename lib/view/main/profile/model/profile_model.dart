import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileModel{
  String? name;
  String? surname;
  String? email;
  Timestamp? birthday;
  String? id;

  ProfileModel({required this.name,required this.surname,required this.email,required this.birthday,required this.id});

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