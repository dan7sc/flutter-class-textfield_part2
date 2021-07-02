import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? errorMessage;

  void validateText(String value) {
    setState(() {
      if (value.isEmpty || (value.length < 10)) {
        errorMessage = "Preencha corretamente o campo!";
      } else {
        errorMessage = null;
      }
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) => validateText(value),
                decoration: InputDecoration(
                    hintText: "00/00/0000",
                    labelText: "Data de Nascimento",
                    labelStyle: TextStyle(color: Colors.black),
                    helperText: "dd/mm/aaaa",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorText: errorMessage),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
              },
              child: Text("Unfocuss"),
            ),
          ],
        ),
      ),
    );
  }
}
