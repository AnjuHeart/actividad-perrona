class Raza {
  late final String valor;

  Raza._(this.valor);

  factory Raza.constructor(String propuesta) {
    if (propuesta.trim().isEmpty) {
      throw ('Nombre de raza está mal formada');
    }
    return Raza._(propuesta);
  }
}
