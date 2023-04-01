import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fswitch_nullsafety/fswitch_nullsafety.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final GlobalKey<RandomTextRevealState> globalKey = GlobalKey();
  List<String> selectedFruits = [];

  final password = RandomPasswordGenerator();

  String text = 'Genrate';
  AssetImage li = const AssetImage('assets/icons/letter-a.png');
  AssetImage ui = const AssetImage('assets/icons/letter-a (1).png');
  AssetImage ni = const AssetImage('assets/icons/123.png');

  Color _color = Colors.blue;
  final _controller = TextEditingController();
  String isOk = '';
  final newpassword = RandomPasswordGenerator();
  bool isNumber = true;
  String? selectedValue;
  final List<int> items = list();
  bool isletterUpperCase = true;
  bool isSpecialChar = true;
  bool isletterLowerCase = true;
  int length = 8;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(children: [
            SizedBox(
              height: 48,
              child: WaveWidget(
                config: CustomConfig(
                  colors: [
                    Colors.white24,
                    Colors.black26,
                    Colors.white10,
                    Colors.black12
                  ],
                  durations: [18000, 8000, 5000, 12000],
                  heightPercentages: [0.100, 0.60, 0.40, 0.60],
                ),
                size: const Size(double.infinity, double.infinity),
                waveAmplitude: 10,
              ),
            ),
            Row(
              children: const [
                Icon(Icons.password, color: Colors.white, size: 35),
                Expanded(
                  child: Center(
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'F2',
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                        shadows: [Shadow(color: Colors.red, blurRadius: 2)],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                Center(
                  child: RandomTextReveal(
                    key: globalKey,
                    text: text.toString(),
                    duration: const Duration(seconds: 2),
                    style: const TextStyle(
                      fontFamily: 'F3',
                      fontSize: 24,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 10,
                    ),
                    curve: Curves.bounceInOut,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Text(isOk, style: TextStyle(color: _color)),
                ElevatedButton(
                  onPressed: () {
                    globalKey.currentState?.play();
                    setState(() {
                      // final newpassword = password.randomPassword(
                      //     numbers: isNumber,
                      //     letters: isletterLowerCase,
                      //     passwordLength: double.parse(length.toString()),
                      //     specialChar: isSpecialChar,
                      //     uppercase: isletterUpperCase);

                    });
                    final newpassword = generatePassword(
                        isNumber: isNumber,
                        length: length,
                        isletterLowerCase: isletterLowerCase,
                        isletterUpperCase: isletterUpperCase,
                        isSpecialChar: isSpecialChar);
                    _controller.text = newpassword;

                    text = _controller.text.toString();

                    double passwordstrength =
                        password.checkPassword(password: _controller.text);
                    if (passwordstrength < 0.3) {
                      _color = Colors.red;
                      isOk = 'This password is weak!';
                    } else if (passwordstrength < 0.7) {
                      _color = Colors.blue;
                      isOk = 'This password is Good';
                    } else {
                      _color = Colors.green;
                      isOk = 'This passsword is Strong';
                    }

                  },
                  child: const Text('genrate'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      const ImageIcon(
                        AssetImage('assets/icons/123.png'),
                        color: Colors.blueGrey,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text('Length',
                              style: TextStyle(
                                fontFamily: 'F2',
                                color: Colors.white60,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                            ],
                          ),
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item.toString(),
                                    child: Text(
                                      item.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as String;
                              length = int.parse(selectedValue.toString());
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 40,
                            width: 80,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                              color: Colors.grey,
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_forward_ios_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.yellow,
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.lightBlue,
                            ),
                            elevation: 8,
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      ImageIcon(li, color: Colors.white),
                      const Expanded(
                        child: Center(
                          child: Text('LowerCase',
                              style: TextStyle(
                                fontFamily: 'F2',
                                color: Colors.white60,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                        ),
                      ),
                      FSwitch(
                        width: 60.0,
                        height: 28,
                        open: isletterLowerCase,
                        onChanged: (v) {
                          setState(() {
                            if (v) {
                              li =
                                  const AssetImage('assets/icons/letter-a.png');
                            } else {
                              li = const AssetImage(
                                  'assets/icons/lowercase-interface-symbol.png');
                            }
                            isletterLowerCase = v;
                          });
                        },
                        closeChild: ImageIcon(li),
                        openChild: ImageIcon(li),
                        childOffset: 3.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(ui, color: Colors.white),
                      ),
                      const Expanded(
                        child: Center(
                          child: Text('UpperCase',
                              style: TextStyle(
                                fontFamily: 'F2',
                                color: Colors.white60,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                        ),
                      ),
                      FSwitch(
                        open: isletterUpperCase,
                        width: 60.0,
                        height: 28,
                        onChanged: (v) {
                          setState(() {
                            if (v) {
                              ui = const AssetImage(
                                  'assets/icons/letter-a (1).png');
                            } else {
                              ui = const AssetImage(
                                  'assets/icons/uppercase-interface-button.png');
                            }
                            isletterUpperCase = v;
                          });
                        },
                        closeChild: ImageIcon(ui),
                        openChild: ImageIcon(ui),
                        childOffset: 3.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      ImageIcon(ni, color: Colors.white),
                      const Expanded(
                        child: Center(
                          child: Text('Numbers',
                              style: TextStyle(
                                fontFamily: 'F2',
                                color: Colors.white60,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                        ),
                      ),
                      FSwitch(
                        open: isNumber,
                        width: 60.0,
                        height: 28,
                        onChanged: (v) {
                          setState(() {
                            if (v) {
                              ni = const AssetImage('assets/icons/123.png');
                            } else {
                              ni = const AssetImage('assets/icons/pin.png');
                            }
                            isNumber = v;
                          });
                        },
                        closeChild: ImageIcon(ni),
                        openChild: ImageIcon(ni),
                        childOffset: 3.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.number,
                        color: Colors.white,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text('Special Char',
                              style: TextStyle(
                                fontFamily: 'F2',
                                color: Colors.white60,
                                shadows: [
                                  Shadow(color: Colors.red, blurRadius: 2)
                                ],
                              )),
                        ),
                      ),
                      FSwitch(
                        open: isSpecialChar,
                        width: 60.0,
                        height: 28,
                        onChanged: (v) {
                          isSpecialChar = v;
                        },
                        closeChild: const Icon(CupertinoIcons.add),
                        openChild: const Icon(CupertinoIcons.number),
                        childOffset: 3.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

String generatePassword({
  required bool isNumber,
  required bool isletterUpperCase,
  required bool isSpecialChar,
  required bool isletterLowerCase,
  required int length,
}) {
  final ln = length;
  const letterLowerCase = "abcdefghijklmnopqrstuvwxyz";
  const letterUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  const number = '0123456789';
  const SpecialChar = '@#%^*>\$@?/[]=+';

  String chars = "";

  if (isletterUpperCase) chars += letterUpperCase.substring(0,length);
  if (isNumber) chars += number;
  if (isSpecialChar) chars += SpecialChar;
  if (isletterLowerCase) chars += letterLowerCase;
  return List.generate(ln, (index) {
    final indexRandom = Random.secure().nextInt(chars.length);
    return chars[indexRandom];
  }).join('');
}

List<int> list() {
  List<int> ls = [];
  for (int i = 8; i <= 50; i++) {
    ls.add(i);
  }
  return ls;
}
