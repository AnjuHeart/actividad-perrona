class RegistroRaza {
  late final String nombreRaza;
  late final List<String> subRazas;

  RegistroRaza._(this.nombreRaza, this.subRazas);

  factory RegistroRaza.constructor(
      {required String propuestaRaza,
      required List<String> propuestaSubRazas}) {
    return RegistroRaza._(propuestaRaza, propuestaSubRazas);
  }
}
