import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authViewModel = Provider.of<LoginViewModel>(context);
    return Column(
      children: [
        RaisedButton(onPressed: (){
          _authViewModel.signOut();
        }, child: Text("Çıkıi yap"),),
      ],
    );
  }
}
