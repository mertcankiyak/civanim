import 'package:civanim/core/components/button/rounded_button.dart';
import 'package:civanim/core/components/textbox/text_form_field.dart';
import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/core/utils/authenticate_validate.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/authenticate/register/model/register_firestore_model.dart';
import 'package:civanim/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:civanim/view/main/profile/model/profile_model.dart';
import 'package:civanim/view/main/profile/viewmodel/profile_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';
import 'package:civanim/core/extensions/timestamp_extension.dart';
import 'package:civanim/core/extensions/datetime_extension.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AuthenticateValidationMixin {
  GlobalKey<FormState> _formkey = GlobalKey();
  DateTime? _secilenTarih;
  DateTime? _yeniTarih;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _dt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _theme = Provider
        .of<ThemeNotifier>(context)
        .customTheme;
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    final _profileViewModel = Provider.of<ProfileViewModel>(context);
    _emailController.text = _loginViewModel.registerFirestoreModel.email ?? "";
    _name.text = _loginViewModel.registerFirestoreModel.name ?? "";
    _surname.text = _loginViewModel.registerFirestoreModel.surname ?? "";
    _dt.text = _yeniTarih == null ? _loginViewModel.registerFirestoreModel.birthday != null
        ? _loginViewModel.registerFirestoreModel.birthday.dateTimeaCevir
        : "" : _yeniTarih!.dateTimeFormat;
    _secilenTarih = _yeniTarih == null ? DateTime.fromMicrosecondsSinceEpoch(
        _loginViewModel.registerFirestoreModel.birthday != null
            ? _loginViewModel
            .registerFirestoreModel.birthday!.microsecondsSinceEpoch
            : DateTime
            .now()
            .microsecondsSinceEpoch): _yeniTarih;
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Text("Profil Bilgileriniz", style: _theme!.themeData!.textTheme.headline6,),
            SizedBox(
              height: 20,
            ),
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
                onTap: () {
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
              child: FlatButton(
                height: context.getWidth * 0.1,
                minWidth: context.getWidth,
                onPressed: () async {
                  ProfileModel guncellenecekProfil = ProfileModel(
                      name: _name.text,
                      surname: _surname.text,
                      email: _emailController.text,
                      birthday: Timestamp.fromDate(_secilenTarih!),
                      id: _loginViewModel.registerFirestoreModel.id,
                  );
                 await _profileViewModel.profileUpdate(guncellecekProfil: guncellenecekProfil).then((value){
                   debugPrint("Güncelleme işlemi: "+ value.toString());
                 });
                },
                color: ConstantColors.softOrangeColor,
                child: Padding(
                  padding: context.minimumPadding,
                  child: Text(
                    "Bilgilerimi Güncelle",
                    style: _theme.themeData!.textTheme.subtitle1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext? context) async {
    final DateTime? picked = await showDatePicker(
        context: context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(1945),
        lastDate: DateTime(2023));
    if (picked != null) {
      print(picked.dateTimeFormat);
      setState(() {
        _secilenTarih = picked;
        _yeniTarih = picked;
        _dt.text = _yeniTarih!.dateTimeFormat;
        print(_secilenTarih);
      });
    }
  }
}
