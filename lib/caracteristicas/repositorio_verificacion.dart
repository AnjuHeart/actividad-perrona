import 'package:actividad_perrona/dominio/problemas.dart';
import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:actividad_perrona/dominio/variable_raza.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRaza(Raza raza);
}

class RepositorioPruebasVerificacion extends RepositorioVerificacion {
  Either<Problema, RegistroRaza> obtenerRegistroRazaDesdeJSon(dynamic json) {
    return Left(RazaNoRegistrada());
  }

  @override
  Either<Problema, RegistroRaza> obtenerRegistroRaza(Raza raza) {
    throw UnimplementedError();
  }
}
