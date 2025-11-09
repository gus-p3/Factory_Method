import 'package:factoty_method/personajes/character_state.dart';
import 'package:factoty_method/personajes/personaje.dart';
import 'package:flame/components.dart';


class Caballero extends PersonajeJugable {
  @override
  final double walkSpeed = 90.0;
  @override
  final double runSpeed = 200.0;
  @override
  final double walkStepTime = 0.1;
  @override
  final double runStepTime = 0.04;

  Caballero({required Vector2 position})
      : super(position: position, size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    animations = {
      CharacterState.quieto: await loadAnimation('caballero_idle.png', 9,
          stepTime: walkStepTime),
      CharacterState.caminar: await loadAnimation('caballero_walk.png', 9,
          stepTime: walkStepTime),
      CharacterState.correr:
          await loadAnimation('caballero_walk.png', 9, stepTime: runStepTime),
      CharacterState.saltar:
          await loadAnimation('caballero_jump.png', 9, loop: false),
      CharacterState.atacar:
          await loadAnimation('caballero_attack.png', 9, loop: false),
    };
    current = CharacterState.quieto;
  }

  @override
  void atacar() {
    if (current != CharacterState.atacar) {
      current = CharacterState.atacar;
      speed = 0;
      print("CABALLERO: ¡Ataque con espada!");
    }
  }

  @override
  void poderEspecial() {
    print("CABALLERO: ¡Escudo activado!");
  }
}