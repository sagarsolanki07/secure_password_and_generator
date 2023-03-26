import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'login.dart';

class Splash extends StatelessWidget {
   Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(centered: true,splash: 'assets/st.gif' ,splashIconSize: MediaQuery.of(context).size.width, nextScreen: Login());
  }
}

