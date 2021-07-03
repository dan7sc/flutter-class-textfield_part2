import 'package:flutter/material.dart';

import 'package:class_textfield_part2/src/shared/widgets/shared_widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String errorMessage = "";

  void validateText(String value) {
    setState(() {
      if (value.isEmpty || (value.length < 10)) {
        errorMessage = "Preencha corretamente o campo!";
      } else {
        errorMessage = "";
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CustomTextField(
                labelText: "Nome",
                onChanged: (value) {  },
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "Telefone",
                onChanged: (value) {},
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "Data de Nascimento",
                onChanged: (value) {},
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "E-mail",
                onChanged: (value) {},
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "CPF",
                onChanged: (value) {},
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "Senha",
                onChanged: (value) {},
                inputFormatters: [],
              ),
              SizedBox(height: 8.0,),
              CustomTextField(
                labelText: "Confirmar Senha",
                onChanged: (value) {},
                inputFormatters: [],
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
      ),
    );
  }
}
