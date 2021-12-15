import 'package:civanim/view/main/home/model/doctors_model.dart';

abstract class DoctorsBASE{

  Future<List<DoctorsModel>> getDoctorsList();
}