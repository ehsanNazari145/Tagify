import 'dart:convert';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_project/screens/all_tags_screen.dart';
import 'package:hackathon_project/screens/login_screen.dart';
import 'package:hackathon_project/screens/new_group_screen.dart';
import 'package:hackathon_project/screens/new_tag_screen.dart';
import '../screens/homescreen.dart';

import 'package:http/http.dart';

class TabsScreen extends StatefulWidget {
  // AadOAuth oauth;
  TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [
    HomeScreen(),
    AllTagsScreen(),
    NewTagScreen(),
    NewGroupScreen(),
  ];
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tagify'),
        backgroundColor: const Color.fromRGBO(108, 52, 217, 0.9),
        elevation: 0,
        actions: <Widget>[
          Builder(builder: (context) {
            return IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout));
          }),
        ],
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Color.fromRGBO(122, 83, 217, 0.9),
        enableFeedback: true,
        selectedItemColor: Color.fromRGBO(76, 42, 159, 1),
        selectedIconTheme: IconThemeData(color: Color.fromRGBO(76, 42, 159, 1)),
        unselectedIconTheme:
            IconThemeData(color: Color.fromRGBO(76, 42, 159, 1)),
        currentIndex: _selectedPageIndex,
        iconSize: 25,
        selectedLabelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 15),
        unselectedLabelStyle:
            GoogleFonts.inter(fontWeight: FontWeight.normal, fontSize: 13),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message_outlined,
                color: Colors.white,
              ),
              label: 'Groups'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.label_important_sharp,
                color: Colors.white,
              ),
              label: 'All Tags'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.new_label_sharp,
                color: Colors.white,
              ),
              label: 'Add Tags'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group_add_sharp,
                color: Colors.white,
              ),
              label: 'Add Group'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.album_outlined), label: 'Create Groups'),
        ],
      ),
    );
  }
}
