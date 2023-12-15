import 'package:flutter/material.dart';
import 'package:mynews/provider/navigationprovider.dart';
import 'package:mynews/screens/HomeScreen.dart';
import 'package:mynews/screens/categoryscreen.dart';
import 'package:mynews/screens/favoritescreen.dart';
import 'package:mynews/screens/settingscreen.dart';
import 'package:mynews/widgets/bottom_nav.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  List<Widget> pagelist = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationState>(
      builder: (context, navigationState, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: pagelist[navigationState.pageIndex],
          bottomNavigationBar:  const BottomNav(),
        );
      }
    );
  }
}




