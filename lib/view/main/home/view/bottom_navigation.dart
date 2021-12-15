import 'package:civanim/core/constants/colors.dart';
import 'package:civanim/core/init/theme/theme_notifier.dart';
import 'package:civanim/view/main/article/view/article_page.dart';
import 'package:civanim/view/main/call/view/call_page.dart';
import 'package:civanim/view/main/home/view/home_page.dart';
import 'package:civanim/view/main/profile/view/profile_page.dart';
import 'package:civanim/view/main/settings/view/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  SelectedItem selectedItem = SelectedItem();
  HomePage? _homePage;
  ArticlePage? _articlePage;
  CallPage? _callPage;
  ProfilePage? _profilePage;
  SettingsPage? _settingsPage;
  List<Widget>? sayfalarim;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _homePage = HomePage();
    _articlePage = ArticlePage();
    _callPage = CallPage();
    _profilePage = ProfilePage();
    _settingsPage = SettingsPage();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context).customTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: ConstantColors.bodyColor,
        body:  IndexedStack(
          children: [
            _homePage!,
            _articlePage!,
            _profilePage!,
            _settingsPage!,
          ],
          index: selectedItem.selectedItemIndex,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.call),
          backgroundColor: ConstantColors.softBlackColor,
          elevation: 5,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          color: ConstantColors.whiteColor,
          child: Container(
            height: 70,
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            selectedItem.selectedItemIndex = 0;
                            selectedItem.selectedItemText = "Anasayfa";
                          });
                        }, icon: Icon(
                          Icons.home_outlined,
                          size: 30,
                          color: selectedItem.selectedItemIndex == 0 ? ConstantColors.softBlackColor : ConstantColors.bottomAppbarGrey,
                        ),),

                        IconButton(onPressed: (){
                          setState(() {
                            selectedItem.selectedItemIndex = 1;
                            selectedItem.selectedItemText = "Makaleler";
                          });
                        }, icon:  Icon(
                          Icons.article_outlined,
                          size: 30,
                          color: selectedItem.selectedItemIndex == 1 ? ConstantColors.softBlackColor : ConstantColors.bottomAppbarGrey,
                        ),),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){
                          setState(() {
                            selectedItem.selectedItemIndex = 2;
                            selectedItem.selectedItemText = "Görüşme Yap";
                          });
                        }, icon: Icon(Icons.person_outline, size: 30, color: selectedItem.selectedItemIndex == 2 ? ConstantColors.softBlackColor : ConstantColors.bottomAppbarGrey,),
                        ),
                        IconButton(onPressed: (){
                          setState(() {
                            selectedItem.selectedItemIndex = 3;
                            selectedItem.selectedItemText = "Ayarlar";
                          });
                        }, icon:Icon(Icons.settings, size: 30, color: selectedItem.selectedItemIndex == 3 ? ConstantColors.softBlackColor : ConstantColors.bottomAppbarGrey,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class SelectedItem{

  //Singleton
  static final SelectedItem _selectedItem = SelectedItem._init();

  factory SelectedItem(){
    return _selectedItem;
  }

  SelectedItem._init();

  String? selectedItemText = "Anasayfa";
  int? selectedItemIndex = 0;
}
