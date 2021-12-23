class Chat {

  String doktorAdi;
  String doktorFoto;
  String doktorUzmanlik;
  String doktorID;
  String hastaID;
  String sohbetOdasiID;

  Map<String, dynamic> toMap(){
    return {
      'doktorAdi' : doktorAdi,
      'doktorFoto': doktorFoto,
      'doktorUzmanlik' : doktorUzmanlik
    };
  }

  Chat.fromMap(Map<String, dynamic> gelenMap):
        doktorAdi = gelenMap['doktorAdi'],
        doktorFoto = gelenMap['doktorFoto'],
        doktorUzmanlik = gelenMap['doktorUzmanlik'],
        doktorID = gelenMap['kisiler'][0],
        hastaID = gelenMap['kisiler'][1],
        sohbetOdasiID = gelenMap['sohbetOdasiID'];
}