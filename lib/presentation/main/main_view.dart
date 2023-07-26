import 'package:corewave_app_task/presentation/main/other_pages/booking_page.dart';
import 'package:corewave_app_task/presentation/main/other_pages/history_page.dart';
import 'package:corewave_app_task/presentation/main/home/home_page.dart';
import 'package:corewave_app_task/presentation/main/other_pages/profile_page.dart';
import 'package:corewave_app_task/presentation/resources/colors_manager.dart';
import 'package:corewave_app_task/presentation/resources/fonts_manager.dart';
import 'package:corewave_app_task/presentation/resources/icons_manager.dart';
import 'package:corewave_app_task/presentation/resources/strings_manager.dart';
import 'package:corewave_app_task/presentation/resources/styles_manager.dart';
import 'package:corewave_app_task/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePage(),
    BookingPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: _getAppBar(),
      body: pages[_currentIndex],
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getAppBar() {
    return AppBar(
      leading: const Icon(IconManager.menu),
      title: _getSearchBar(),
      actions: const [
        Padding(
          padding: EdgeInsets.all(AppPaddingManager.p10),
          child: Icon(IconManager.bell),
        ),
      ],
    );
  }

  _getSearchBar() {
    return Container(
      width: double.maxFinite,
      height: AppSizeManager.s40,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(AppSizeManager.s10)),
        border: Border.all(
          color: ColorManager.darkGrey,
          width: AppSizeManager.s1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            IconManager.search,
            color: ColorManager.darkGrey,
            size: AppSizeManager.s24,
          ),
          Text(
            StringManager.search,
            style: mediumTextStyleManager(
              color: ColorManager.darkGrey,
              fontSize: FontSizeManager.s14,
            ),
          ),
        ],
      ),
    );
  }

  _getBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: StringManager.home,
          icon: Icon(IconManager.home),
        ),
        BottomNavigationBarItem(
          label: StringManager.booking,
          icon: Icon(IconManager.booking),
        ),
        BottomNavigationBarItem(
          label: StringManager.history,
          icon: Icon(IconManager.history),
        ),
        BottomNavigationBarItem(
          label: StringManager.profile,
          icon: Icon(IconManager.profile),
        ),
      ],
    );
  }
}
