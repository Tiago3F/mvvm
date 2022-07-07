class PersonModel {
  final double altura;
  final double peso;

  PersonModel({required this.altura, required this.peso});

  double getImc() {
    return peso / (altura * altura);
  }
}
