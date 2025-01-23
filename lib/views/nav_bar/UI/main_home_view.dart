import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:our_market/core/app_colors.dart';
import 'package:our_market/views/favorite/UI/favorite_view.dart';
import 'package:our_market/views/home/UI/home_view.dart';
import 'package:our_market/views/nav_bar/logic/cubit/nav_bar_cubit.dart';
import 'package:our_market/views/profile/UI/profile_view.dart';
import 'package:our_market/views/store/UI/store_view.dart';

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});

  final List<Widget> views = [
    HomeView(),
    StoreView(),
    FavoriteView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavBarCubit(),
        child: BlocBuilder<NavBarCubit, NavBarState>(builder: (context, state) {
          NavBarCubit cubit = BlocProvider.of<NavBarCubit>(context);
          return Scaffold(
            body: SafeArea(child: views[cubit.currentIndex]),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: AppColors.kWhiteColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: GNav(
                    onTabChange: (index) {
                      cubit.changeCurrentIndex(index);
                    },
                    rippleColor: AppColors
                        .kPrimaryColor, // tab button ripple color when pressed
                    hoverColor:
                        AppColors.kPrimaryColor, // tab button hover color
                    //  curve: Curves.easeOutExpo, // tab animation curves
                    duration:
                        Duration(milliseconds: 400), // tab animation duration
                    gap: 8, // the tab button gap between icon and text
                    color: AppColors.kGreyColor, // unselected icon color
                    activeColor:
                        AppColors.kWhiteColor, // selected icon and text color
                    iconSize: 28, // tab button icon size
                    tabBackgroundColor: AppColors
                        .kPrimaryColor, // selected tab background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12), // navigation bar padding
                    tabs: [
                      GButton(
                        icon: LineIcons.home,
                        text: 'Home',
                      ),
                      GButton(
                        icon: LineIcons.store,
                        text: 'Store',
                      ),
                      GButton(
                        icon: LineIcons.heart,
                        text: 'Favorite',
                      ),
                      GButton(
                        icon: LineIcons.user,
                        text: 'Profile',
                      )
                    ]),
              ),
            ),
          );
        }));
  }
}
