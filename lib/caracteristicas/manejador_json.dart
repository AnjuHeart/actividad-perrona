import 'dart:convert';
import 'package:actividad_perrona/dominio/problemas.dart';
import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:fpdart/fpdart.dart';

class Model {
  final Map<String, dynamic> objetosJson;

  Model._(this.objetosJson);

  factory Model.fromJson({required String jsonString}) {
    JsonDecoder decoder = const JsonDecoder();

    final Map<String, dynamic> jsonObject = decoder.convert(jsonString);

    final Map<String, dynamic> message = jsonObject['message'];
    return Model._(message);
  }

  Either<Problema, RegistroRaza> jsonContieneRaza(String raza) {
    RegistroRaza? posibleRaza;
    objetosJson.forEach((razaJson, subRazas) {
      if (razaJson == raza) {
        List<String> subRazasDeRazaEncontrada = [];
        subRazas.forEach(
            (subRaza) => subRazasDeRazaEncontrada.add(subRaza.toString()));
        posibleRaza = RegistroRaza.constructor(
            propuestaRaza: razaJson,
            propuestaSubRazas: subRazasDeRazaEncontrada);
      }
    });
    if (posibleRaza is RegistroRaza) {
      return Right(posibleRaza!);
    }
    return Left(RazaNoRegistrada());
  }
}
