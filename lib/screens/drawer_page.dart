import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:fully_authotication_app/screens/demo_screen.dart';
import 'package:fully_authotication_app/screens/menu_screen.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF25073E),
      body: ZoomDrawer(
        style: DrawerStyle.defaultStyle,
        showShadow: true,
        menuScreen: MenuPage(),
        mainScreen: DemoScreen(),
      ),
    );
  }
}
