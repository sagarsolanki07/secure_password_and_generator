import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_state_button/multi_state_button.dart';
import 'package:secure_password_and_generator/navigationpage.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  var user = TextEditingController();
  var password = TextEditingController();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const String _submit = "Submit";
  static const String _loading = "Loading";
  static const String _success = "Success";
  final MultiStateButtonController multiStateButtonController =
      MultiStateButtonController(initialStateName: _submit);

  bool passwordVisible = true;
  final inputBorder = BorderRadius.circular(25.7);
  final colorizeColors = [
    Colors.lightBlue,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.teal,
    Colors.amber,
    Colors.blueAccent,
    Colors.redAccent,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'F2',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        right: true,
        left: true,
        bottom: true,
        child: Stack(fit: StackFit.expand, children: [
          Image.asset('assets/bg.gif', fit: BoxFit.fill),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 50.0, fontFamily: 'F2', color: Colors.blue),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('SECURE'),
                        ScaleAnimatedText('SAVE'),
                        ScaleAnimatedText('&'),
                        ScaleAnimatedText('GENRATE'),
                      ],
                      onTap: () {},
                    ),
                  ),
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.redAccent, fontSize: 45, fontFamily: 'F3'),
                ),
                Card(
                  shadowColor: Colors.lightGreen.shade200,
                  color: Colors.black45,
                  elevation: 5,
                  margin: const EdgeInsets.only(top: 15),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('USER NAME',
                              style: TextStyle(
                                  fontFamily: 'F2',
                                  fontStyle: FontStyle.italic,
                                  color: Colors.amberAccent,
                                  shadows: [
                                    Shadow(color: Colors.green, blurRadius: 5)
                                  ])),
                        ),
                        TextField(
                            controller: widget.user,
                            textAlign: TextAlign.justify,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(color: Colors.red, blurRadius: 20)
                                  ]),
                              filled: true,
                              fillColor: Colors.blue.withOpacity(.1),
                              contentPadding: EdgeInsets.zero,
                              errorStyle: const TextStyle(
                                backgroundColor: Colors.orange,
                                color: Colors.white,
                              ),
                              labelStyle: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 4),
                                borderRadius: inputBorder,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade400, width: 5),
                                borderRadius: inputBorder,
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade700, width: 7),
                                borderRadius: inputBorder,
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade400, width: 8),
                                borderRadius: inputBorder,
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 5),
                                borderRadius: inputBorder,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.tealAccent,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(color: Colors.red, blurRadius: 30)
                              ],
                            )),
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('PASSWORD',
                              style: TextStyle(
                                  fontFamily: 'F2',
                                  fontStyle: FontStyle.italic,
                                  wordSpacing: 0.1,
                                  color: Colors.amberAccent,
                                  shadows: [
                                    Shadow(color: Colors.green, blurRadius: 10)
                                  ])),
                        ),
                        TextField(
                            controller: widget.password,
                            obscureText: passwordVisible,
                            textAlign: TextAlign.justify,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password_sharp,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(color: Colors.red, blurRadius: 20)
                                  ]),
                              filled: true,
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                              fillColor: Colors.blue.withOpacity(.1),
                              contentPadding: EdgeInsets.zero,
                              errorStyle: const TextStyle(
                                backgroundColor: Colors.orange,
                                color: Colors.white,
                              ),
                              labelStyle: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blue.shade700, width: 4),
                                borderRadius: inputBorder,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade400, width: 5),
                                borderRadius: inputBorder,
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade700, width: 7),
                                borderRadius: inputBorder,
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red.shade400, width: 8),
                                borderRadius: inputBorder,
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.red, width: 5),
                                borderRadius: inputBorder,
                              ),
                            ),
                            style: const TextStyle(
                              color: Colors.greenAccent,
                              shadows: [
                                Shadow(color: Colors.deepPurple, blurRadius: 2)
                              ],
                            )),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black54),
                              elevation: MaterialStateProperty.all(9.0),
                              shape: MaterialStateProperty.all(
                                  BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            onPressed: () {},
                            child: const Text('NEW USER',
                                style: TextStyle(
                                  fontFamily: 'F2',
                                  color: Colors.white54,
                                  shadows: [
                                    Shadow(color: Colors.red, blurRadius: 2)
                                  ],
                                )),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(5),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                              elevation: MaterialStateProperty.all(9.0),
                              shape: MaterialStateProperty.all(
                                  BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            onPressed: () {
                              Future(() {
                                return Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) {
                                    return NavigationPage();
                                  },
                                ));
                              });
                            },
                            child: const Text('Login',
                                style: TextStyle(
                                  fontFamily: 'F2',
                                  color: Colors.white60,
                                  shadows: [
                                    Shadow(color: Colors.red, blurRadius: 2)
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
