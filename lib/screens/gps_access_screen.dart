import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/blocs/blocs.dart';

class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('GPS Access'),
      // ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            print('state: $state');

            return state.isGpsEnabled
                ? const _AccesButton()
                : const _EnableGpsMessage();
          },
        ),
      ),
    );
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Es necesario el Acceso al GPS",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 30),
        MaterialButton(
          onPressed: () => print("click"),
          color: Colors.black,
          shape: const StadiumBorder(),
          splashColor: Colors.transparent,
          child: const Text(
            "Solicitar Acceso",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text('Debe de habilitar el GPS',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)),
        ),
      ],
    );
  }
}
