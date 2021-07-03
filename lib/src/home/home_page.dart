import 'package:flutter/material.dart';

import 'package:class_textfield_part2/src/shared/widgets/shared_widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _bornDateController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  FocusNode _passwordFocusNode = FocusNode();

  void changeVlue() {
    _cpfController.value.text;
  }

  @override
  void initState() {
    _passwordFocusNode.addListener(() {
      if (_passwordFocusNode.hasPrimaryFocus) {
        setState(() {});
      }
    });
    super.initState();
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
                controller: _nameController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "Telefone",
                controller: _phoneController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "Data de Nascimento",
                controller: _bornDateController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "E-mail",
                controller: _emailController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "CPF",
                controller: _cpfController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "Senha",
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                suffixIcon: _passwordFocusNode.hasFocus
                    ? ClearButton(controller: _passwordController)
                    : Container(),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                labelText: "Confirmar Senha",
                controller: _confirmPasswordController,
                suffixIcon: ClearButton(
                  controller: _confirmPasswordController,
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
      ),
    );
  }
}
