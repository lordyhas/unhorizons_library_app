library home;

import 'dart:ui';
import 'package:badges/badges.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unh_biblio/routes.dart';
import 'package:unh_biblio/src/background_image.dart';


import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/services.dart';
import 'package:utils_component/utils_component.dart';



import '../data_repository/values.dart';
import '../res.dart';

part 'home/drawer_view.dart';
part 'home/home_screen.dart';
part 'home/item_card_widget.dart';


class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  bool _isClosed = true;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 600)
        );

    _animation1 = Tween<double>(begin: 0, end: 10).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))..addListener(() {
      setState(() {});
    })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _isClosed = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .5).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<bool> _willPopDialog() async {
    return (await showDialog<bool>(
        context: context,
        builder: (context) => ContentDialog(
          title: Text(
            "Exit ExploShop",
            //style: TextStyle, //Theme.of(context).textTheme.bodyText2,
          ),
          content: const Text("Do you want to exit ExploShop ?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),

              child: const Text("Quit"),
            ),
          ],
        ))) ?? false ;

  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => _willPopDialog(),
      child: NavigationView(
        //extendBodyBehindAppBar: true,
        appBar: NavigationAppBar(
          //elevation: 0,
          //backgroundColor: Colors.transparent,
          leading: IconButton(
            //tooltip: "Open menu",
            icon: Icon(FluentIcons.context_menu,
              //color: Theme.of(context).primaryColorLight,
            ),
            //splashColor: Colors.transparent,
            onPressed: () {
              if (_isClosed == true) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              _isClosed = false;
            },
          ),
          actions: Row(
            children: [
              Padding(
                padding:  const EdgeInsets.only(right: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.05),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: (){},
                    icon: Badge(
                      //toAnimate: false,
                      position: BadgePosition.topEnd(end: -5, top: -2),
                      shape: BadgeShape.circle,
                      badgeColor: Colors.red,
                      /*badgeContent: const Text('1',
                        style: TextStyle(color: Colors.white),
                    ),*/
                      child: Icon(
                        FontAwesomeIcons.bell,
                        color: Colors.white.withOpacity(.7),
                      ),
                    ),
                    /**/
                  ),
                ),
              ),
            ],
          )
        ),
        content: Stack(
          children: [
            /// Background Image
            const BackgroundCover(),

            /// home screen
            SizedBox(
              height: _height,
              width: _width,
              child: const HomeScreen(),
            ),

            /// Drawer
            ///CustomNavigationDrawer(),
            DrawerView(
              blurAnimation: _animation1,
              opacityAnimation: _animation2,
              scaleAnimation: _animation3,
              isClose: _isClosed,
              onClose: (){
                if (_isClosed == true) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                _isClosed = false;
              },
            ),
          ],
        ),
      ),
    );
  }


}

