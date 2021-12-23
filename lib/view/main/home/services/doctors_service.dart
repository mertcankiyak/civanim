import 'package:civanim/view/main/home/base/doctors_base.dart';
import 'package:civanim/view/main/home/model/doctors_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorsService implements DoctorsBASE{

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<DoctorsModel>> getDoctorsList() async {
    List<DoctorsModel> _doctorsList = [];
    QuerySnapshot<Map<String,dynamic>> doctorsSorgula = await  _firebaseFirestore.collection("doktorlar").get();
    doctorsSorgula.docs.forEach((element) {
      _doctorsList.add(DoctorsModel.fromMap(element.data()));
    });
    return _doctorsList;
  }

  @override
  Future<List<DoctorsModel>> servislerdekiDoktorlariGetir({String? servisID}) async {
    List<DoctorsModel> _doctorsList = [];
    QuerySnapshot<Map<String,dynamic>> doctorsSorgula = await  _firebaseFirestore.collection("doktorlar").where("servis_id", isEqualTo: servisID).get();
    doctorsSorgula.docs.forEach((element) {
      _doctorsList.add(DoctorsModel.fromMap(element.data()));
    });
    return _doctorsList;
  }

}