import 'package:civanim/core/components/textbox/text_form_field.dart';
import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/strings.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/core/utils/authenticate_validate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with AuthenticateValidationMixin {

  @override
  Widget build(BuildContext context) {
    final _theme = Provider.of<ThemeNotifier>(context).customTheme;
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
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: ConstantColors.softBlackColor,
                onTap: (){},
                child: Ink(
                  decoration: BoxDecoration(
                      color: ConstantColors.softOrangeColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  width: context.getWidth,
                  height: context.getWidth * 0.12,
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login, color: ConstantColors.whiteColor,),

                      Text("Giriş yap", style:  _theme.themeData!.textTheme.headline3, textAlign: TextAlign.center,),
                      Container(),
                    ],
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                splashColor: ConstantColors.softOrangeColor,
                onTap: (){},
                child: Ink(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                      color: ConstantColors.softBlackColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  width: context.getWidth,
                  height: context.getWidth * 0.12,
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.email, color: ConstantColors.whiteColor,),

                      Text("Kayıt ol", style:  _theme.themeData!.textTheme.headline3, textAlign: TextAlign.center,),
                      Container(),
                    ],
                  )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
    );
  }
}

