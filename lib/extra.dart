import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List upper = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  List<String> selectedFruits = [];

  final _items =
      upper.map((upper) => MultiSelectItem(upper, upper.toString())).toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration( border: Border(bottom: BorderSide(color: Colors.transparent))) ,
      child: MultiSelectBottomSheetField(
        initialChildSize: 0.4,
        listType: MultiSelectListType.CHIP,
        buttonIcon: Icon(CupertinoIcons.add),
        buttonText: Text('UpperCase',

            style: TextStyle(
              fontFamily: 'F2',
              color: Colors.white60,
              shadows: [Shadow(color: Colors.red, blurRadius: 2)],
            )),
        title: Text("Animals"),
        items: _items,
        onConfirm: (value) {
          selectedFruits.add(value.toString());
        },
        chipDisplay: MultiSelectChipDisplay(
          onTap: (value) {
            setState(() {
              selectedFruits.remove(value);
            });
          },
        ),
      ),
    );
  }
}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SmartDialogPage(),
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
    );
  }
}

class SmartDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('SmartDialog-EasyDemo')),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Wrap(spacing: 20, children: [
          //attach
          ElevatedButton(
            onPressed: () => _showAttach(context),
            child: Text('showAttach'),
          ),


        ]),
      ),
    );
  }


  void _showAttach(BuildContext context) {
    var attachDialog = (BuildContext context) {
      SmartDialog.showAttach(
        targetContext: context,
        alignment: Alignment.bottomCenter,
        animationType: SmartAnimationType.scale,
        highlightBuilder: (_, __) {
          return Positioned(child: Container());
        },
        scalePointBuilder: (selfSize) => Offset(selfSize.width, 0),
        builder: (_) {
          return Container(height: 50, width: 30, color: Colors.red);
        },
      );
    };

    //target widget
    SmartDialog.show(
      useSystem: true,
      builder: (_) {
        return Container(
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () => attachDialog(context),
              child: Text('target widget'),
            );
          }),
        );
      },
    );
  }



}








class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 350,
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              width: selected ? 50.0 : 50.0,
              height: selected ? 200.0 : 50.0,
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  child:  const Text('Tap me'),
                ),
              ),
            ),
          ],
        ),
    );
  }
}




