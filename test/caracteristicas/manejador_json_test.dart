import 'package:test/test.dart';
import 'package:actividad_perrona/caracteristicas/manejador_json.dart';

void main() {
  group('Pruebas con Json correcto', () {
    String json =
        '''
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
    final claseRaza = Model.fromJson(jsonString: json).objetosJson;

    test("El json tiene contenidos", () {
      expect(claseRaza.containsKey("bulldog"), equals(true));
    });
    test("El json no esta vacio", () {
      expect(claseRaza.isEmpty, equals(false));
    });
    test("El json encuentra hijos/subrazas", () {
      bool bandera = false;
      claseRaza.forEach((raza, subrazas) {
        if (subrazas.contains("english")) {
          bandera = true;
        }
      });
      expect(bandera, equals(true));
    });
  });
}
