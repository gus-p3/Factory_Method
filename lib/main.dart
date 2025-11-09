import 'package:factoty_method/personajes/arquero.dart';
import 'package:factoty_method/personajes/caballero.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

enum PersonajeTipo { arquero, caballero, campesino }

void main() {
  runApp(
    GameWidget(
      game: MiJuegoDemo(),
      overlayBuilderMap: {
        'UI': (context, game) => ControlesUI(game: game as MiJuegoDemo),
      },
      initialActiveOverlays: const ['UI'],
    ),
  );
}

class MiJuegoDemo extends FlameGame {
  @override
  Color backgroundColor() => Colors.grey.shade900;
  late Arquero arquero;
  late Caballero caballero;

  void spawnPersonaje() {
    Vector2 position = Vector2(50, 50 + (0 * 120.0));
    arquero = Arquero(position: position);
    add(arquero);
    position = Vector2(50, 50 + (1 * 120.0));
    caballero = Caballero(position: position);
    add(caballero);
  }

  void ordenarEstarQuieto() {
    arquero.estarQuieto();
    caballero.estarQuieto();
  }

  void ordenarCaminar() {
    arquero.caminar();
    caballero.caminar();

  }

  void ordenarCorrer() {
    arquero.correr();
    caballero.correr();
  }

  void ordenarSaltar() {
    arquero.saltar();
    caballero.saltar();
  }

  void ordenarAccionEspecial() {
    arquero.atacar();
    caballero.atacar();
  }
}

class ControlesUI extends StatelessWidget {
  final MiJuegoDemo game;
  const ControlesUI({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CREACIÓN (Acoplamiento Fuerte)",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(
                child: Text("Crear Personaje"),
                onPressed: () => game.spawnPersonaje(),
              ),
            ],
          ),
          Spacer(),
          Text(
            "ACCIONES (Repetitivas)",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Wrap(
            spacing: 8,
            alignment: WrapAlignment.start,
            children: [
              ElevatedButton(
                child: Text("Parar"),
                onPressed: () => game.ordenarEstarQuieto(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade700,
                ),
              ),
              ElevatedButton(
                child: Text("Caminar"),
                onPressed: () => game.ordenarCaminar(),
              ),
              ElevatedButton(
                child: Text("Correr"),
                onPressed: () => game.ordenarCorrer(),
              ),
              ElevatedButton(
                child: Text("Saltar (Jugables)"),
                onPressed: () => game.ordenarSaltar(),
              ),
              ElevatedButton(
                child: Text("Acción"),
                onPressed: () => game.ordenarAccionEspecial(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
