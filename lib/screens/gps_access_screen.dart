import 'package:flutter/material.dart';

class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _AccesButton(),
    );
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Es necesario el acceso a GPS",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
        MaterialButton(
            onPressed: () => print("click"),
            color: Colors.black,
            shape: const StadiumBorder(),
            splashColor: Colors.transparent,
            child: const Text(
              "Solicitar Acceso",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Debe de habilitar el GPS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
    );
  }
}
