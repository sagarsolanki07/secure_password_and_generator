import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Colors.black,
        body: Padding(
          padding:  const EdgeInsets.only(left: 15,right: 15),
          child: AppBar(
            backgroundColor: Colors.transparent,

            title: Column(children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Sagar Solanki',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'F4',
                        color: Colors.white60,
                        shadows: [Shadow(color: Colors.red, blurRadius: 2)],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    radius: 20,
                    child: IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      color: Colors.white,
                      icon: const Icon(CupertinoIcons.moon, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
