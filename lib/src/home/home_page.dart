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

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                textInputAction: TextInputAction.next,
                labelText: "Nome",
                controller: _nameController,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Telefone",
                controller: _phoneController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Data de Nascimento",
                controller: _bornDateController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "E-mail",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "CPF",
                controller: _cpfController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Senha",
                controller: _passwordController,
                // focusNode: _passwordFocusNode,
                obscureText: passwordVisible,
                suffixIcon: VisibleWidget(
                  visible: passwordVisible,
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              CustomTextField(
                textInputAction: TextInputAction.next,
                labelText: "Confirmar Senha",
                controller: _confirmPasswordController,
                obscureText: confirmPasswordVisible,
                suffixIcon: VisibleWidget(
                  visible: confirmPasswordVisible,
                  onPressed: () {
                    setState(() {
                      confirmPasswordVisible = !confirmPasswordVisible;
                    });
                  },
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
