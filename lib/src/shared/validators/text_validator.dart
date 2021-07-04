class Validators {
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Preencha corretamente o nome";
    } else {
      return null;
    }
  }
}
