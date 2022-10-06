import 'package:flutter/material.dart';

class VistaCreandose extends StatelessWidget {
  const VistaCreandose({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      height: 100,
      width: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
