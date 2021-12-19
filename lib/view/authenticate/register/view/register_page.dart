import 'dart:math';

import 'package:civanim/core/components/button/rounded_button.dart';
import 'package:civanim/core/components/textbox/text_form_field.dart';
import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/core/utils/authenticate_validate.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';
import 'package:civanim/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/datetime_extension.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> with AuthenticateValidationMixin {
  GlobalKey<FormState> _formkey = GlobalKey();
  DateTime? _secilenTarih;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _dt = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _secilenTarih = DateTime.now();
  }
  @override
  Widget build(BuildContext context) {

    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _registerViewModel = Provider.of<RegisterViewModel>(context);
    final _loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.bodyColor,
        elevation: 0,
        title: Text("Civanım", style: _theme!.themeData!.textTheme.headline1,),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "İsim",
                  icon: Icon(Icons.person_outline),
                  textEditingController: _name,
                  validator: lengthControl,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Soyisim",
                  icon: Icon(Icons.person_outline),
                  textEditingController: _surname,
                  validator: lengthControl,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  onTap: (){
                    _selectDate(context);
                  },
                  hintText: "Doğum Tarihi",
                  icon: Icon(Icons.calendar_today),
                  textEditingController: _dt,
                  validator: lengthControl,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Email",
                  icon: Icon(Icons.email_outlined),
                  textEditingController: _emailController,
                  validator: validateEmail,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  obsecureText: true,
                  hintText: "Şifre",
                  icon: Icon(Icons.password),
                  textEditingController: _passwordController,
                  validator: validatePassword,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RadiusTextFormField(
                  hintText: "Şifre Tekrar",
                  icon: Icon(Icons.password),
                  textEditingController: _rePasswordController,
                  validator: (value){
                    if(_rePasswordController.text.length>0){
                      if(_passwordController.text == _rePasswordController.text){
                        return null;
                      }else{
                        return "Şifreler eşleşmiyor";
                      }
                    }else{
                      return "Şifreniz 6 karakterden az olamaz.";
                    }
                  },
                  obsecureText: true,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RoundedButton(
                  text: "Kayıt Ol",
                  backgroundColor: ConstantColors.softBlackColor,
                  splashColor: ConstantColors.softOrangeColor,
                  icon: Icon(Icons.email, color: ConstantColors.whiteColor,),
                  onTap: () async {
                    if(_formkey.currentState!.validate()==true){
                      _formkey.currentState!.save();
                      await _registerViewModel.signUpWithEmail(email: _emailController.text, password: _rePasswordController.text).then((value) async{
                        await _loginViewModel.currentUser().then((value) async {
                          RegisterFirestoreModel _eklenecekKullaniciModel = RegisterFirestoreModel(name: _name.text, surname: _surname.text, email: _emailController.text, birthday: Timestamp.fromMicrosecondsSinceEpoch(_secilenTarih!.microsecondsSinceEpoch), id: value.id);
                          await _registerViewModel.firestoreAddUser(model: _eklenecekKullaniciModel).then((value){
                            Navigator.pop(context);
                          });

                        });
                      });

                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext? context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: now,
        lastDate: DateTime.now());
    if (picked != null) {
      print(picked.dateTimeFormat);
      setState(() {
        _secilenTarih = picked;
        _dt.text = picked.dateTimeFormat;
      });
    }
  }
}
