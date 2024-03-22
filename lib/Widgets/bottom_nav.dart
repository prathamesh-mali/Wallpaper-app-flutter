import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/Screens/all_wallpaper.dart';
import 'package:wallpaper_app/Screens/categories_screen.dart';
import 'package:wallpaper_app/Screens/home_screen.dart';
import 'package:wallpaper_app/Screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int curretTabIndex = 0;

  late List<Widget> pages;
  late HomePage home;
  late SearchScreen searchScreen;
  late Categories categories;
  late Widget currentpage;

  @override
  void initState() {
    home = const HomePage();
    searchScreen = const SearchScreen();
    categories = const Categories();
    // allWallpapers = AllWallpapers();
    currentpage = const HomePage();

    pages = [
      home,
      searchScreen,
      categories,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        buttonBackgroundColor: Colors.black,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 75, 75, 75),
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            curretTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.category,
            color: Colors.white,
          ),
          // Icon(
          //   Icons.all_out,
          //   color: Colors.white,
          // )
        ],
      ),
      body: pages[curretTabIndex],
    );
  }
}
