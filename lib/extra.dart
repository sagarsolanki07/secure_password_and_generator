import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:random_text_reveal/random_text_reveal.dart';


import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
String generatePassword({
  required bool isNumber ,
  required bool isletterUpperCase ,
  required bool isSpecialChar ,
  required bool isletterLowerCase ,
  required int length,
}) {
  final ln = length;
  final letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  final letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final number = '0123456789';
  final SpecialChar = '@#%^*>\$@?/[]=+';

  String chars = "";

  if (isletterUpperCase) chars += '$letterUpperCase';
  if (isNumber) chars += '$number';
  if (isSpecialChar) chars += '$SpecialChar';
  if (isletterLowerCase) chars += '$letterLowerCase';
  return List.generate(ln, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars[indexRandom];
  }).join('');
}





List<int> list(){
  List<int> ls=[];
  for(int i=8;i<=50;i++){
    ls.add(i);
  }
  return ls;

}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> fruits = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
  List<String> selectedFruits = [];
  List<Animal> _selectedAnimals2 = [];
  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  final _multiSelectKey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiselect Dropdown'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.4),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
        child: Column(
          children: <Widget>[
            MultiSelectBottomSheetField(
              initialChildSize: 0.4,
              listType: MultiSelectListType.CHIP,

              buttonText: Text("Favorite Animals"),
              title: Text("Animals"),
              items: _items,
              onConfirm: (values) {

              },
              chipDisplay: MultiSelectChipDisplay(
                onTap: (value) {
                  setState(() {
                    _selectedAnimals2.remove(value);
                  });
                },
              ),
            ),
            selectedFruits == null || selectedFruits.isEmpty
                ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "None selected",
                  style: TextStyle(color: Colors.black54),
                ))
                : Container(),
          ],
        ),
      ),

        );

  }

}
class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}