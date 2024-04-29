import 'package:flutter/material.dart';

class JugadorFormulario extends StatefulWidget {
  const JugadorFormulario({Key? key}) : super(key: key);

  @override
  JugadorFormularioState createState() => JugadorFormularioState();
}

class JugadorFormularioState extends State<JugadorFormulario> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller, // Añade un controlador al TextField
              decoration: const InputDecoration(labelText: 'nombre'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String nombre = _controller.text; // Obtiene el nombre del TextField
                Navigator.pop(context, nombre); // Devuelve el nombre a través de Navigator.pop
              },
              child: const Text('guardar'),
            )
          ],
        ),
      ),
    );
  }
}
