class Validators {
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Preencha corretamente o nome";
    } else {
      return null;
    }
  }

  String? validateAge(String value) {
    if (value.length != 10) {
      return "Insira data no formato dd/mm/yyyy";
    } else {
      final dateList = value.split("/");
      try {
        if (int.tryParse(dateList[0])! < 1 ||
          int.tryParse(dateList[0])! > 31) {
          return "Digite um dia válido";
        } else if (int.tryParse(dateList[1])! < 1 ||
          int.tryParse(dateList[1])! > 12) {
          return "Digite um mês válido";
        }
        final date = DateTime(
          int.tryParse(dateList[2])!,
          int.tryParse(dateList[1])!,
          int.tryParse(dateList[0])!,
        );

        bool has18 =
            DateTime.now().subtract(Duration(days: 6570)).isAfter(date);
        bool hasLessThan120 =
            DateTime.now().subtract(Duration(days: 43800)).isAfter(date);

        if (has18) {
          if (hasLessThan120) {
            return "Data inválida";
          }
          return null;
        } else {
          return "É necessário ser maior de 18 anos";
        }
      } catch (e) {
        return "Insira data no formato dd/mm/yyyy";
      }
    }
  }
}
