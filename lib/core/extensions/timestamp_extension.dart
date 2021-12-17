import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

extension TimestamExtension on Timestamp?{

  String get yasHesapla {
    DateTime gununTarihi = DateTime.now();
    DateTime dogumTarihi = DateTime.fromMicrosecondsSinceEpoch(this!.microsecondsSinceEpoch);
    return (gununTarihi.year - dogumTarihi.year).toString()+ " Yaşında";
  }

  String get dateTimeaCevir {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(DateTime.fromMicrosecondsSinceEpoch(this!.microsecondsSinceEpoch));
    return formatted;
  }

}