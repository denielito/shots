// pantalla_juego.dart
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
//import 'home_screen.dart'; 

class PantallaJuego extends StatefulWidget {

  final String nombreJugador;
  final List<String> jugadores;

  

  const PantallaJuego({Key? key, required this.nombreJugador, required this.jugadores}): super(key: key);

  @override
  PantallaJuegoState createState() => PantallaJuegoState();
}

class PantallaJuegoState extends State<PantallaJuego> {
  String reto = '';
  String nuevoJugador = '';

  void obtenerNuevoReto() async {
    String contenido = await rootBundle.loadString('lib/assets/retos.json');
    List<dynamic> listaRetos = json.decode(contenido);
    setState(() {
      reto = listaRetos[Random().nextInt(listaRetos.length)]['descripcion'];
    });
  }

  void obtenerNuevoJugador() {
    setState(() {
      int index = Random().nextInt(widget.jugadores.length);
      nuevoJugador = widget.jugadores[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Jugador Seleccionado:',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              nuevoJugador.isNotEmpty ? nuevoJugador : widget.nombreJugador,
              style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Reto:',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              reto,
              style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                obtenerNuevoReto();
                obtenerNuevoJugador();
              },
              child: const Text('Nuevo Reto y Jugador'),
            ),
          ],
        ),
      ),
    );
  }
}
