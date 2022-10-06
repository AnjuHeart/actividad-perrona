import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';

class VistaSolicitudActualizacion extends StatelessWidget {
  const VistaSolicitudActualizacion({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Solicitud incorrecta",
              style: Theme.of(context).textTheme.headline2),
          TextButton(
              onPressed: () {
                var bloc = context.read<BlocDogVerification>();
                bloc.add(Creado());
              },
              child: const Text("REGRESAR"))
        ],
      ),
    );
  }
}
