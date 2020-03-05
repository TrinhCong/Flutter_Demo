import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo/widgets/left_drawer_title.dart';
import 'package:flutter_demo/sizes.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  MainPage();

  @override
  MainPageState createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        gradient:
            LinearGradient(colors: [Color(0xFF3E4DBF), Color(0xFF15B1FF)]),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        elevation: 0.0,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/logo.png"),
              width: 36,
            ),
            Text(
              "Flutter_Demo",
              style: TextStyle(
                fontFamily: 'Roboto-Condensed',
                fontWeight: FontWeight.bold,
                fontSize: ArchMediaSizes.getFontSize(14.0),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/main_bg.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Text("Vietgis Flutter Demo",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            height: ArchMediaSizes.screenHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF463BB8),
                  Color(0xFF07FBDF),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(28 / 3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFFF7F7F7)),
                        child: Icon(
                          MdiIcons.account,
                          color: Color(0xFFB2B2B2),
                          size: 28,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Demo",
                              style: TextStyle(
                                fontSize: ArchMediaSizes.getFontSize(20.0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Condensed',
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "100",
                              style: TextStyle(
                                fontSize: ArchMediaSizes.getFontSize(16.0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto-Condensed',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                LeftDrawerTile(
                  icon: MdiIcons.wallet,
                  text: "Danh mục",
                  onTap: () {},
                ),
                LeftDrawerTile(
                  icon: MdiIcons.history,
                  text: "Sản Phẩm",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
