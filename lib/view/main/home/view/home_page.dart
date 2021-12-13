import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/constants/size.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:civanim/core/extensions/size_extension.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColors.bodyColor,
        body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: ConstantColors.softOrangeColor,
          child: ListView(
            padding: context.mediumPadding,
            children: [
              Text("Merhaba, Mert!", style: theme!.themeData!.textTheme.headline1,),
              SizedBox(height: context.getWidth*0.03,),
              Text("Bugün kendini nasıl hissediyorsun?", style: theme.themeData!.textTheme.headline2,),
              SizedBox(height: context.getWidth*0.06,),
              Container(
                width: context.getWidth,
                height: context.getWidth*0.35,
                decoration: BoxDecoration(
                  color: ConstantColors.softBlackColor,
                  borderRadius: BorderRadius.all(Radius.circular(20,),),
                ),
                child: Padding(
                  padding: context.mediumSymetricPadding,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(flex: 2,child: Text("Pandemi sırasında ruh sağlınıza dikkat edin", style: theme.themeData!.textTheme.headline3, maxLines: 3, softWrap: true, overflow: TextOverflow.ellipsis,)),
                            SizedBox(height: context.getWidth*0.05,),
                            Container(
                              decoration: BoxDecoration(
                                color: ConstantColors.softOrangeColor,
                                borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Padding(
                                padding: context.minimumPadding,
                                child: Text("Hemen oku", style: theme.themeData!.textTheme.headline4,),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Stack(
                            children: [
                              Positioned.fill(left: 0,top: 0,
                                child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset("assets/images/doctor.png")
                                ),
                              ),
                            ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.getWidth*0.06,),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10,),),
                ),
                child: Padding(
                  padding: context.spesificPadding(5, 5, 20, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Ara',
                        hintStyle: theme.themeData!.textTheme.headline5,
                        border: InputBorder.none,
                        fillColor: Colors.grey,
                        focusColor: Colors.grey
                    ),
                  ),
                ),
              ),
              SizedBox(height: context.getWidth*0.06,),
              Text("Tüm Servisler", style: theme.themeData!.textTheme.headline6,),
              SizedBox(height: context.getWidth*0.06,),
              Container(
                height: context.getHeight*0.2,
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.right,
                  color: ConstantColors.softOrangeColor,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                       padding: context.minimumPadding,
                       child: Column(
                         children: [
                           Container(
                            height: context.getHeight*0.12,
                             decoration: BoxDecoration(
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.2),
                                     spreadRadius: 1,
                                     blurRadius: 10,
                                     offset: Offset(0, 1), // changes position of shadow
                                   ),
                                 ],
                                 color: ConstantColors.whiteColor,
                                 borderRadius: BorderRadius.all(Radius.circular(20))
                             ),
                             child: Image.asset("assets/images/coronavirus.png", scale: 4,),
                           ),
                           SizedBox(height: context.getWidth*0.03,),
                           Text("Corona", style: theme.themeData!.textTheme.headline2,),
                         ],
                       ),
                     ),
                      Padding(
                        padding: context.minimumPadding,
                        child: Column(
                          children: [
                            Container(
                              height: context.getHeight*0.12,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                  color: ConstantColors.whiteColor,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Image.asset("assets/images/coronavirus.png", scale: 4,),
                            ),
                            SizedBox(height: context.getWidth*0.03,),
                            Text("Corona", style: theme.themeData!.textTheme.headline2,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.minimumPadding,
                        child: Column(
                          children: [
                            Container(
                              height: context.getHeight*0.12,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                  color: ConstantColors.whiteColor,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Image.asset("assets/images/coronavirus.png", scale: 4,),
                            ),
                            SizedBox(height: context.getWidth*0.03,),
                            Text("Corona", style: theme.themeData!.textTheme.headline2,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: context.minimumPadding,
                        child: Column(
                          children: [
                            Container(
                              height: context.getHeight*0.12,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 1), // changes position of shadow
                                    ),
                                  ],
                                  color: ConstantColors.whiteColor,
                                  borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Image.asset("assets/images/coronavirus.png", scale: 4,),
                            ),
                            SizedBox(height: context.getWidth*0.03,),
                            Text("Corona", style: theme.themeData!.textTheme.headline2,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: context.getWidth*0.06,),
              Text("Doktorlarımız", style: theme.themeData!.textTheme.headline6,),
              Container(
                height: context.getHeight*0.2,
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.right,
                  color: ConstantColors.softOrangeColor,
                  child: ListView(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: context.spesificPadding(SizeConstants.mediumSize, 0, 0, SizeConstants.minimumSize),
                        child: Container(
                          width: context.getWidth*0.8,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 1), // changes position of shadow
                                ),
                              ],
                              color: ConstantColors.whiteColor,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: context.mediumSymetricPadding,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(backgroundImage: NetworkImage("https://toppng.com//public/uploads/preview/doctor-png-115539657696wynrkvdhh.png"),backgroundColor: ConstantColors.greyColor, radius: 30,),
                                    SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Dr. Mert Can Kıyak", style: theme.themeData!.textTheme.headline6,),
                                        Text("Kalp Cerrahı", style: theme.themeData!.textTheme.headline5,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                        color: ConstantColors.greyColor,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding: context.minimumSymetricPadding,
                                      child: Row(
                                        children: [
                                          Icon(Icons.male),
                                          Text("Erkek", style: theme.themeData!.textTheme.bodyText1,),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(),
                                  Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: Offset(0, 1), // changes position of shadow
                                          ),
                                        ],
                                        color: ConstantColors.greyColor,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Padding(
                                      padding: context.minimumSymetricPadding,
                                      child: Row(
                                        children: [
                                          Icon(Icons.date_range),
                                          Text("68 Yaşında", style: theme.themeData!.textTheme.bodyText1,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
