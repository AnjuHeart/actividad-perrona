import 'package:bloc/bloc.dart';

class Evento{}
class PrimerEvento extends Evento{}

class Estado{}
class EstadoCreado extends Estado{}

class BlocDogVerification extends Bloc<Evento, Estado> {
  BlocDogVerification() : super(EstadoCreado()) {
    on<PrimerEvento>((event, emit) {
      // TODO: implement event handler
    });
  }
}