import 'dart:async';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:assignment1/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/theme/color_theme.dart';
import '../home/schedule.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> screens = <Widget>[
    HomeScreen(),
    ScheduleScreen(),
    HomeScreen(),
    ScheduleScreen(),
    HomeScreen()
  ];

  final iconList = [
    Icons.home,
    Icons.schedule,
    Icons.add,
    Icons.message,
    Icons.person_2
  ];
  final _selectedPageIndex = 0.obs;
  AnimationController? _animationController;
  CurvedAnimation? curve;
  PageController? _pageController;

  void _onTap(int index) {
    setState(() {
      _selectedPageIndex.value = index;
    });
  }

  @override
  void initState() {
    _selectedPageIndex.value = 0;
    _pageController = PageController();
    super.initState();
  }

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      key: _scaffoldKey,
      bottomNavigationBar: btmBar(),
      body: WillPopScope(
          onWillPop: () async {
            bool status = false;
            if (_selectedPageIndex.value != 0) {
              setState(() {
                _selectedPageIndex.value = 0;
                status = false;
              });
            } else {
              DateTime now = DateTime.now();
              if (currentBackPressTime == null ||
                  now.difference(currentBackPressTime!) >
                      Duration(seconds: 2)) {
                currentBackPressTime = now;

                return Future.value(false);
              }
              setState(() {
                status = true;
              });
            }
            return status;
          },
          child: Obx(() => screens[_selectedPageIndex.value])),
    );
  }

  btmBar() {
    return Obx(() => Stack(
          children: [
            AnimatedBottomNavigationBar.builder(
              height: 69,
              itemCount: iconList.length,
              tabBuilder: (int index, bool isActive) {
                final color = isActive ? Color(0xff51B448) : Color(0xffABABAB);
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // color: isActive
                        //     ? Color(0xff51B448).withOpacity(0.2)
                        //     : Colors.transparent,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(iconList[index],
                        color: color, size: isActive == true ? 30.px : 24.px));
              },
              activeIndex: _selectedPageIndex.value,
              splashSpeedInMilliseconds: 150,
              leftCornerRadius: 8,
              rightCornerRadius: 8,
              onTap: _onTap,
              gapLocation: GapLocation.none,
            )
          ],
        ));
  }
}
