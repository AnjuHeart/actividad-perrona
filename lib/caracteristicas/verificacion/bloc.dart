import 'package:bloc/bloc.dart';

class Evento {}

class Creado extends Evento {}

class NombreRazaConfirmado extends Evento {}

class NombreRazaRecibido extends Evento {}

class Estado {}

class EstadoCreado extends Estado {}

class SolicitandoRaza extends Estado {}

class EsperandoConfirmacionRaza extends Estado {}

class BlocDogVerification extends Bloc<Evento, Estado> {
  BlocDogVerification() : super(EstadoCreado()) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });
    on<NombreRazaRecibido>((event, emit) {
      emit(EsperandoConfirmacionRaza());
    });
  }
}
