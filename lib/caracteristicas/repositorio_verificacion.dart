import 'package:actividad_perrona/caracteristicas/manejador_json.dart';
import 'package:actividad_perrona/dominio/problemas.dart';
import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:actividad_perrona/dominio/variable_raza.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(Raza raza);
}

class RepositorioPruebasVerificacion extends RepositorioVerificacion {
  @override
  Either<Problema, RegistroRaza> obtenerRegistroRaza(Raza raza) {
    const String jSonEjemplo = '''
        {
          "message": {
            "akita": [],
            "appenzeller": [],
            "bulldog": [
                "boston",
                "english",
                "french"
            ],
            "australian": [
                "shepherd"
            ]
          },
          "status": "success"
        }
        ''';
    const String jSonIncorrecto = '''
        {
          "message": {
            "akita": [],
            "appenzeller": [],
            "bulldog": [
                "boston",
                "english",
                "french"
            ],
            "australian": [
                "shepherd"
            ]
          },
          "status": "failure"
        }
        ''';
    try {
      var elementosJson = Model.fromJson(jsonString: jSonEjemplo);
      if (raza.valor == 'incorrecto') {
        elementosJson = Model.fromJson(jsonString: jSonIncorrecto);
      }
      return elementosJson.jsonContieneRaza(raza.valor);
    } on Problema catch (e) {
      return Left(e);
    }
  }
}
