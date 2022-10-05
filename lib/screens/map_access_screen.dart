import 'package:flutter/material.dart';

class MapAccess extends StatelessWidget {
  const MapAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Debe de habilitar el GPS',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
