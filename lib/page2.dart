import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'extra.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
    bool _fromTop = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(),   );
  }
}
