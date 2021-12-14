import 'package:civanim/view/main/home/base/service_base.dart';
import 'package:civanim/view/main/home/model/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServicesService implements ServiceBase{
  
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<ServiceModel>> getServiceList() async {
    List<ServiceModel> _serviceListesi = [];
    QuerySnapshot<Map<String,dynamic>> servisSorgula = await  _firebaseFirestore.collection("servisler").get();
    servisSorgula.docs.forEach((element) {
      _serviceListesi.add(ServiceModel.fromMap(element.data()));
    });
    return _serviceListesi;
  }

}