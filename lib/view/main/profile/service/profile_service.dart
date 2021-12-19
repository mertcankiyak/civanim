import 'package:civanim/view/main/profile/base/profile_base.dart';
import 'package:civanim/view/main/profile/model/profile_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileService implements  ProfileBASE{

  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<bool> profileUpdate({required ProfileModel guncellecekProfil}) async {
    QuerySnapshot<Map<String,dynamic>> gelenVeri =  await  _firebaseFirestore.collection("kullanicilar").where("kullanici_id",isEqualTo: guncellecekProfil.id).get();
    if(gelenVeri.docs.length>0){
      await  _firebaseFirestore.collection("kullanicilar").doc(gelenVeri.docs[0].id).update(guncellecekProfil.toMap());
      return true;
    }else{
      return false;
    }
  }


}