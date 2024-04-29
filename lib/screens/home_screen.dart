// home_screen.dart
import 'package:flutter/material.dart';
import 'formulario.dart';
import 'pantalla_juego.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int contador = 0;
  List<String> jugadores = [];

  void reducirContador() {
    setState(() {
      contador--;
      if (contador == -1){
        contador = 0;
      }
      jugadores.removeLast(); // add player
    });
  }

  void incrementarContador() {
    setState(() {
      contador++;
      jugadores.add(''); // remove the last player
    });
  }

  void irAFormulario(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const JugadorFormulario()
      ),
    ).then((nombre){
      if (nombre != null) {
        setState(() {
          jugadores[index] = nombre;
        });
      }
    });
  }

  void empezarJuego() {
    if (jugadores.isNotEmpty) {
      int indexJugador = Random().nextInt(jugadores.length);
      String jugadorSeleccionado = jugadores[indexJugador];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaJuego(
            nombreJugador: jugadorSeleccionado,
            jugadores: jugadores,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('game'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    reducirContador();
                  },
                   icon: const Icon(Icons.remove)
                ),
                Text(
                  '$contador',
                  style: const TextStyle(fontSize: 24)
                ),
                IconButton(
                  onPressed: (){
                    incrementarContador();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0
              ),
              itemCount: jugadores.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    irAFormulario(index);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 100.0,
                    height: 100.0,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        jugadores[index],
                        style: const TextStyle(
                          color: Colors.white30,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ElevatedButton(onPressed: empezarJuego, child: const Text('INICIO'))
        ],
      ),
    );
  }
}
