import 'package:flutter/material.dart';
import 'package:word_events/globals/app_theme.dart';
import 'package:word_events/screens/add_screen/add_page.dart';
import 'package:word_events/screens/profile_screen/profile_page.dart';
import 'package:word_events/screens/search_screen/search_page.dart';


final AppColors _appColors = AppColors();

int _selectedIndex = 0;

final List<Widget> screensList = <Widget>[
  const SearchPage(),
  const SearchPage(),
  const ProfilePage()
];



// appbar widget
AppBar appbar() {
  return AppBar(
    title: Text(
      "World Events",
      style: TextStyle(color: _appColors.primaryColor),
    ),
    centerTitle: true,
    leading: IconButton(
        onPressed: (){

        },
        icon: const Icon(Icons.g_translate_outlined)),
    backgroundColor: _appColors.secondaryColor,
    foregroundColor: _appColors.primaryColor,
  );
}

// body widget
Widget buildUI() {
  return Center(
    child: screensList.elementAt(_selectedIndex),
  );
}

// bottom nav bar widget
Widget bottomNavBar(Function(int) _onTapped) {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: "Search",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_circle_outline),
        label: "Post",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.manage_accounts),
        label: "Profile",
      ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: _appColors.primaryColor,
    onTap: _onTapped,
  );
}