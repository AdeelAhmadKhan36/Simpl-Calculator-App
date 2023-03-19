import 'package:calculator_app/Componants/containers.dart';
import 'package:calculator_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userinput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Simple Claculator')),
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight ,
                      child: Text(
                        userinput.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        answer.toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                width: 400,
                decoration: BoxDecoration(
                    color: Color(0xff2B2D42),
                border: Border.all(color: Color(0xff2B2D42), width: 10),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.yellowAccent,
                    //     blurRadius: 8,
                    //   ),
                    ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(
                          title: 'AC',
                          onPress: () {
                            userinput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '+/-',
                          onPress: () {
                            userinput += '+/-';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '%',
                            onPress: () {
                              userinput += '%';
                              setState(() {});
                            }),
                        MyButton(
                            title: '/',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userinput += '/';
                              setState(() {});
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '7',
                          onPress: () {
                            userinput += '7';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '8',
                          onPress: () {
                            userinput += '8';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '0',
                            onPress: () {
                              userinput += '0';
                              setState(() {});
                            }),
                        MyButton(
                            title: 'x',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userinput += 'x';
                              setState(() {});
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '4',
                          onPress: () {
                            userinput += '4';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '5',
                          onPress: () {
                            userinput += '5';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '6',
                            onPress: () {
                              userinput += '6';
                              setState(() {});
                            }),
                        MyButton(
                            title: '-',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userinput += '-';
                              setState(() {});
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '1',
                          onPress: () {
                            userinput += '1';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '2',
                          onPress: () {
                            userinput += '2';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: '3',
                            onPress: () {
                              userinput += '3';
                              setState(() {});
                            }),
                        MyButton(
                            title: '+',
                            color: Color(0xffffa00a),
                            onPress: () {
                              userinput += '+';
                              setState(() {});
                            })
                      ],
                    ),
                    SizedBox(
                      height: 20,

                    ),
                    Row(
                      children: [
                        MyButton(
                          title: '0',
                          onPress: () {
                            userinput += '0';
                            setState(() {});
                          },
                        ),
                        MyButton(
                          title: '.',
                          onPress: () {
                            userinput += '.';
                            setState(() {});
                          },
                        ),
                        MyButton(
                            title: 'Del',
                            onPress: () {
                              userinput=userinput.substring(0,userinput.length-1);
                              setState(() {});
                            }),
                        MyButton(
                            title: '=',
                            color: Color(0xffffa00a),
                            onPress: () {
                              eqaulPress();
                              setState(() {});
                            })
                      ],
                    ),



                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void eqaulPress() {
    String finalUserInput = userinput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}


