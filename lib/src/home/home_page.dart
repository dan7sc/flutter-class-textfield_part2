import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:class_textfield_part2/src/shared/widgets/shared_widgets.dart';
import 'package:class_textfield_part2/src/shared/validators/text_validator.dart';

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

  FocusNode _cpfFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _bornDateController.dispose();
    _emailController.dispose();
    _cpfController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cpfFocusNode.dispose();
    _passwordFocusNode.dispose();
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
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Nome",
                  controller: _nameController,
                  validator: (value) => Validators().validateName(value!),
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Telefone",
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(14),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  validator: (value) => Validators().validateAge(value!),
                  labelText: "Data de Nascimento",
                  controller: _bornDateController,
                  keyboardType: TextInputType.text,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
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
                  focusNode: _cpfFocusNode,
                  keyboardType: TextInputType.text,
                  validator: (cpf) => Validators().cpfValidator(cpf!),
                ),
                SizedBox(
                  height: 8.0,
                ),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  labelText: "Senha",
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
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
                  validator: (value) => Validators().validatePassword(
                    value!,
                    _passwordController.value.text,
                  ),
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
                SizedBox(
                  height: 80.0,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Tudo certo por aqui",
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            if (Validators()
                                    .cpfValidator(_cpfController.value.text) !=
                                null) {
                              _cpfFocusNode.requestFocus();
                            }
                          }
                        },
                        child: Text("Criar conta"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
