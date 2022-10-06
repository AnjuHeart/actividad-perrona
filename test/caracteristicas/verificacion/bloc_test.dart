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

  blocTest<BlocDogVerification, Estado>(
    'emite un nombre confirmado si encuentra el nombre',
    build: () => BlocDogVerification(),
    act: (bloc) => bloc.add(NombreRazaRecibido("akita")),
    expect: () => [isA<MostrandoRazaConfirmada>()],
  );

  blocTest<BlocDogVerification, Estado>(
    'emite un nombre no confirmado si no encuentra el nombre',
    build: () => BlocDogVerification(),
    act: (bloc) => bloc.add(NombreRazaRecibido("loquesea")),
    expect: () => [isA<MostrandoRazaNoConfirmada>()],
  );
  blocTest<BlocDogVerification, Estado>(
    'emite solicitud de actualizar api si hay un error',
    build: () => BlocDogVerification(),
    act: (bloc) => bloc.add(NombreRazaRecibido("incorrecto")),
    expect: () => [isA<MostrandoSolicitudActualizacion>()],
  );
}
