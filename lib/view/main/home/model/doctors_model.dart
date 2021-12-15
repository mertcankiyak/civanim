import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorsModel{

  String? doctorName;
  Timestamp? doctorDate;
  String? doctorFoto;
  String? doctorId;
  bool? doctorMusait;
  String? doctorSoyadi;
  String? doctorTel;
  String? doctorUzmanlik;
  String? doctorCinsiyet;


  DoctorsModel.fromMap(Map<String, dynamic> map):
        doctorName = map['doktor_adi'],
        doctorDate = map['doktor_dt'],
        doctorFoto = map['doktor_foto'],
        doctorId = map['doktor_id'],
        doctorMusait = map['doktor_musait'],
        doctorSoyadi = map['doktor_soyadi'],
        doctorTel = map['doktor_tel'],
        doctorCinsiyet = map['doktor_cinsiyet'],
        doctorUzmanlik = map['doktor_uzmanlik'];

}