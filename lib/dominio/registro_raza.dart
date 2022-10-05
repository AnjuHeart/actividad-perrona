import 'package:fpdart/fpdart.dart';

const String mensajeRegistroRazaError = "Error en el registro de raza";

class RegistroRaza {
  late final String nombreRaza;
  late final Either<String, List<String>> subRazas;

  RegistroRaza._(this.nombreRaza, this.subRazas);

  factory RegistroRaza.constructor(
      {required String propuestaRaza,
      required List<String> propuestaSubRazas}) {
    Either<String, List<String>> checkSubRazas_(List<String> posiblesSubRazas) {
      if (posiblesSubRazas.isEmpty) {
        return const Left("Esta raza no tiene subrazas");
      }
      return Right(posiblesSubRazas);
    }

    if (propuestaRaza.trim().isEmpty) {
      throw (mensajeRegistroRazaError);
    }
    var estadoSubRaza = checkSubRazas_(propuestaSubRazas);
    return RegistroRaza._(propuestaRaza, estadoSubRaza);
  }
}
