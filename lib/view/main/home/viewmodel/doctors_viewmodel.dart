import 'package:civanim/locator.dart';
import 'package:civanim/view/main/home/base/doctors_base.dart';
import 'package:civanim/view/main/home/model/doctors_model.dart';
import 'package:civanim/view/main/home/services/doctors_service.dart';
import 'package:flutter/cupertino.dart';

class DoctorsViewModel with ChangeNotifier implements DoctorsBASE{

  DoctorsService _doctorsService = locator<DoctorsService>();

  @override
  Future<List<DoctorsModel>> getDoctorsList() async {
    try{
      return await _doctorsService.getDoctorsList();
    }catch(e){
      throw "getDoctorsList Hata: "+ e.toString();
    }
  }

}