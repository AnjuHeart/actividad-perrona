import 'package:actividad_perrona/caracteristicas/repositorio_verificacion.dart';
import 'package:actividad_perrona/dominio/problemas.dart';
import 'package:actividad_perrona/dominio/variable_raza.dart';
import 'package:test/test.dart';

void main() {
  group('Pruebas de verificacion offline', () {
    RepositorioPruebasVerificacion repositorio =
        RepositorioPruebasVerificacion();

    test('Devuelve un registro si el nombre existe', () {
      final resultado =
          repositorio.obtenerRegistroRaza(Raza.constructor("akita"));
      expect(resultado.isRight(), true);
      resultado.match(
        (l) {
          expect(true, true);
        },
        (r) {
          expect(r.nombreRaza, equals("akita"));
        },
      );
    });
    test('Devuelve problema si el nombre no existe', () {
      final resultado =
          repositorio.obtenerRegistroRaza(Raza.constructor("loquesea"));
      expect(resultado.isLeft(), true);
      resultado.match(
        (l) {
          expect(l, isA<RazaNoRegistrada>());
        },
        (r) {},
      );
    });
  });
}
