import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mynews/provider/navigationprovider.dart';
import 'package:mynews/widgets/bottom_nav_widget.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationState>(
      builder: (context, navigationState, child) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(
                    onTap: () => navigationState.pageIndex = 0,
                    icon: navigationState.pageIndex == 0
                        ? Iconsax.home_11
                        : Iconsax.home,
                  ),
                  BottomNavWidget(
                    onTap: () => navigationState.pageIndex = 1,
                    icon: navigationState.pageIndex == 1
                        ? Iconsax.category_25
                        : Iconsax.category,

                  ),
                  BottomNavWidget(
                    onTap: () => navigationState.pageIndex = 2,
                    icon: navigationState.pageIndex == 2
                        ? MaterialIcons.favorite
                        : MaterialIcons.favorite_outline
                  ),
                  BottomNavWidget(
                    onTap: () => navigationState.pageIndex = 3,
                    icon: navigationState.pageIndex == 3
                     ? MaterialCommunityIcons.account_settings
                      : MaterialCommunityIcons.account_settings_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
