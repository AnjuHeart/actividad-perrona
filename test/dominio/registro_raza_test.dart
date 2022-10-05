import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:test/test.dart';

void main() {
  group('Registro de raza correcto', () {
    final registro = RegistroRaza.constructor(
        propuestaRaza: "razaejemplo",
        propuestaSubRazas: ["subRaza1", "subRaza2"]);

    final registroSinSubRaza = RegistroRaza.constructor(
        propuestaRaza: "razaEjemplo2", propuestaSubRazas: []);

    test('CheckRegistroRaza', () {
      expect(registro.nombreRaza, equals("razaejemplo"));
    });
    test('CheckSubRazas', () {
      registro.subRazas.match(
        (l) {
          expect(l.isEmpty, equals(true));
        },
        (r) {
          expect(r.contains("subRaza1"), equals(true));
          expect(r.contains("subRaza3"), equals(false));
        },
      );
    });
    test('Check Registro sin sub raza', () {
      registroSinSubRaza.subRazas.match(
        (l) {
          expect(l.isEmpty, false);
        },
        (r) {
          expect(r.isEmpty, equals(true));
        },
      );
    });
  });
}
