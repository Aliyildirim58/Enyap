import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/screens/post_add.dart';
import 'package:loginpage/screens/profile_page.dart';
import 'package:loginpage/screens/flow_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int selectedpage = 0;
  final _pageOptions = [FlowPage(), Profile(), Postadd()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home,title: "Home",),
          TabItem(icon: Icons.person_outline, title: "Profile"),
          TabItem(icon: Icons.add, title: "Add"),
        ],
        backgroundColor: Colors.purple,
        initialActiveIndex: selectedpage,
        onTap: (int index) {
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }
}
