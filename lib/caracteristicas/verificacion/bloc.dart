import 'package:actividad_perrona/caracteristicas/repositorio_verificacion.dart';
import 'package:actividad_perrona/dominio/problemas.dart';
import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:actividad_perrona/dominio/variable_raza.dart';
import 'package:bloc/bloc.dart';

class Evento {}

class Creado extends Evento {}

class NombreRazaConfirmado extends Evento {}

class NombreRazaRecibido extends Evento {
  final String razaAProcesar;

  NombreRazaRecibido(this.razaAProcesar);
}

class Estado {}

class Creandose extends Estado {}

class SolicitandoRaza extends Estado {}

class MostrandoRazaConfirmada extends Estado {
  final RegistroRaza registroRaza;

  MostrandoRazaConfirmada(this.registroRaza);
}

class MostrandoRazaNoConfirmada extends Estado {
  final String nombreNoConfirmado;

  MostrandoRazaNoConfirmada(this.nombreNoConfirmado);
}

class MostrandoSolicitudActualizacion extends Estado {}

class BlocDogVerification extends Bloc<Evento, Estado> {
  BlocDogVerification() : super(Creandose()) {
    on<Creado>((event, emit) {
      emit(SolicitandoRaza());
    });
    on<NombreRazaRecibido>((event, emit) {
      RepositorioPruebasVerificacion repo = RepositorioPruebasVerificacion();
      var posibleRaza =
          repo.obtenerRegistroRaza(Raza.constructor(event.razaAProcesar));

      posibleRaza.match((l) {
        l is ProblemaFormatoJson
            ? emit(MostrandoSolicitudActualizacion())
            : null;
        l is RazaNoRegistrada
            ? emit(MostrandoRazaNoConfirmada(event.razaAProcesar))
            : null;
      }, (r) {
        emit(MostrandoRazaConfirmada(r));
      });
    });
  }
}
