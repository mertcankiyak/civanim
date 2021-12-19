import 'package:civanim/core/components/button/rounded_button.dart';
import 'package:civanim/core/components/textbox/text_form_field.dart';
import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/strings.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/core/utils/authenticate_validate.dart';
import 'package:civanim/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:civanim/view/authenticate/register/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AuthenticateValidationMixin {
  GlobalKey<FormState> _formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
    final _authViewModel = Provider.of<LoginViewModel>(context);
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Text("Cebinizdeki Sağlık",style: _theme.themeData!.textTheme.headline6,),
              SizedBox(height: 20,),
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
                  hintText: "Şifre",
                  icon: Icon(Icons.password),
                  textEditingController: _passwordController,
                  validator: validatePassword,
                  obsecureText: true,
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RoundedButton(
                  text: "Giriş Yap",
                  backgroundColor: ConstantColors.softOrangeColor,
                  splashColor: ConstantColors.softBlackColor,
                  icon: Icon(Icons.login, color: ConstantColors.whiteColor,),
                  onTap: () async {
                    if(_formkey.currentState!.validate()==true){
                      _formkey.currentState!.save();
                      await _authViewModel.loginWithEmail(email: _emailController.text.trim(), password: _passwordController.text.trim()).then((value) async {
                        await _authViewModel.girisYapmisKullaniciBilgileriniCek(email: _emailController.text);
                      });

                    }
                  },
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: RoundedButton(
                  text: "Kayıt Ol",
                  backgroundColor: ConstantColors.softBlackColor,
                  splashColor: ConstantColors.softOrangeColor,
                  icon: Icon(Icons.email, color: ConstantColors.whiteColor,),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  },
                ),
              ),
              Padding(
                padding: context.minimumPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Şifremi unuttum", style: _theme.themeData!.textTheme.bodyText2, textAlign: TextAlign.right,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

