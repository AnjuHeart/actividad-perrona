import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';

void main() {
  blocTest<BlocDogVerification, Estado>(
    'emite un Estado de espera de solicitud al crearse',
    build: () => BlocDogVerification(),
    act: (bloc) => bloc.add(Creado()),
    expect: () => [isA<SolicitandoRaza>()],
  );
}