import 'package:flutter/material.dart';
import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VistaMostrandoRazaNoEncontrada extends StatelessWidget {
  const VistaMostrandoRazaNoEncontrada({super.key, required this.raza});
  final String raza;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("La raza: $raza no tiene registro")),
        TextButton(
            onPressed: () {
              var bloc = context.read<BlocDogVerification>();
              bloc.add(Creado());
            },
            child: const Text("Volver a pedir raza")),
      ],
    );
  }
}
