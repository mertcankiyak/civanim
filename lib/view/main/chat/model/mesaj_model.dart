import 'package:cloud_firestore/cloud_firestore.dart';

class Mesaj {
  String? gonderen;
  String? mesaj;
  DateTime? tarih;


  Mesaj({this.gonderen, this.mesaj, this.tarih});

  Map<String, dynamic> toMap() {
    return {
      'gonderen': gonderen,
      'mesaj': mesaj,
      'tarih':tarih?? FieldValue.serverTimestamp(),
    };
  }

  Mesaj.fromMap(Map<String, dynamic> map):
        gonderen = map['gonderen'],
        mesaj = map['mesaj'],
        tarih = (map['tarih'] as Timestamp).toDate();
}
