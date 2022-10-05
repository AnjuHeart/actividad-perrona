class Model {
  final String raza;
  final List<String> subRazas;

  Model._(this.raza, this.subRazas);

  factory Model.fromJson({required dynamic json}) {
    String razaVerificada = "";
    List<String> subRazasVerificadas = [];
    return Model._(razaVerificada, subRazasVerificadas);
  }
}
