import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:secure_password_and_generator/page2.dart';
import 'package:secure_password_and_generator/page3.dart';

import 'login.dart';
import 'page1.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false; //<-- SEE HERE
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    allowImplicitScrolling: false,
                    controller: _pageController,
                    children:  <Widget>[
                      Page1(),
                      Page2(),
                      Page3(),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: CurvedNavigationBar(
                    buttonBackgroundColor: Colors.transparent,
                    color: Colors.blueGrey,
                    backgroundColor: Colors.transparent,
                    key: _bottomNavigationKey,
                    animationDuration: Duration(seconds: 1),
                    items: <Widget>[
                      Column(
                        children: const [
                          Text('Genrate',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'F1',
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                          Icon(Icons.add, size: 30, color: Colors.white),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('Save',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'F1',
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                          Icon(Icons.paste_sharp,
                              size: 30, color: Colors.white),
                        ],
                      ),
                      Column(
                        children: const [
                          Text('Account',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'F1',
                                color: Colors.white,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                          Icon(Icons.account_circle_outlined,
                              size: 30, color: Colors.white),
                        ],
                      ),
                    ],
                    onTap: (index) {
                      setState(() {
                        _page = _page;
                        _pageController.jumpToPage(index);
                      });
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
