import 'dart:convert';

import 'package:civanim/view/main/corona/base/corona_base.dart';
import 'package:civanim/view/main/corona/model/corona_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoronaService implements CoronaBASE{

  @override
  Future<List<CoronaModel>?> getData() async {
    var response = await http.get(Uri.parse("https://api.covid19api.com/dayone/country/turkey"));
    if(response.statusCode == 200){
      List<CoronaModel> gelenVeri = coronaModelFromJson(response.body);
      Iterable<CoronaModel> donusenList = gelenVeri.reversed;
      return donusenList.toList();
    }else{
      return null;
    }


  }
}