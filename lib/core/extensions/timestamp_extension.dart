import 'package:cloud_firestore/cloud_firestore.dart';

extension TimestamExtension on Timestamp?{

  String get yasHesapla {
    DateTime gununTarihi = DateTime.now();
    DateTime dogumTarihi = DateTime.fromMicrosecondsSinceEpoch(this!.microsecondsSinceEpoch);
    return (gununTarihi.year - dogumTarihi.year).toString()+ " Yaşında";
  }

}