import 'package:civanim/locator.dart';
import 'package:civanim/view/main/corona/base/corona_base.dart';
import 'package:civanim/view/main/corona/model/corona_model.dart';
import 'package:civanim/view/main/corona/service/corona_service.dart';
import 'package:flutter/cupertino.dart';

class CoronaViewModel with ChangeNotifier implements CoronaBASE{

  CoronaService _coronaService = locator<CoronaService>();

  @override
  Future<List<CoronaModel>?> getData() async {
    try{
       return await _coronaService.getData();
    }catch(e){
      debugPrint("Corona View Model'da bir hata çıktı: "+ e.toString());
      return null;
    }

  }


}