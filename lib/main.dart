import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_mostrando_confirmado.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_mostrando_no_encontrada.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_solicitud.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_solicitud_actualizacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_creandose.dart';

void main() {
  runApp(const BlocApplication());
}

class BlocApplication extends StatelessWidget {
  const BlocApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        BlocDogVerification blocDogVerification = BlocDogVerification();
        Future.delayed(const Duration(seconds: 2), () {
          blocDogVerification.add(Creado());
        });
        return blocDogVerification;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context) {
          var estado = context.watch<BlocDogVerification>().state;
          if (estado is Creandose) {
            return const VistaCreandose();
          }
          if (estado is SolicitandoRaza) {
            return const VistaSolicitudRaza();
          }
          if (estado is MostrandoRazaConfirmada) {
            return VistaMostrandoRazaConfirmada(registro: estado.registroRaza);
          }
          if (estado is MostrandoRazaNoConfirmada) {
            return VistaMostrandoRazaNoEncontrada(
                raza: estado.nombreNoConfirmado);
          }
          if (estado is MostrandoSolicitudActualizacion) {
            return const VistaSolicitudActualizacion();
          }
          return const Center(child: Text("No hay soporte para esta acción"));
        }),
      ),
    );
  }
}
