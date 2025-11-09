import 'package:factoty_method/personajes/character_state.dart';
import 'package:factoty_method/personajes/personaje.dart';
import 'package:flame/components.dart';


class Arquero extends PersonajeJugable {
  @override
  final double walkSpeed = 80.0;
  @override
  final double runSpeed = 180.0;
  @override
  final double walkStepTime = 0.1;
  @override
  final double runStepTime = 0.05;

  Arquero({required Vector2 position, })
      : super(position: position, size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    animations = {
      CharacterState.quieto:
          await loadAnimation('arquero_idle.png', 9, stepTime: walkStepTime),
      CharacterState.caminar:
          await loadAnimation('arquero_walk.png', 9, stepTime: walkStepTime),
      CharacterState.correr:
          await loadAnimation('arquero_walk.png', 9, stepTime: runStepTime),
      CharacterState.saltar:
          await loadAnimation('arquero_jump.png', 9, loop: false),
      CharacterState.atacar:
          await loadAnimation('arquero_attack.png', 9, loop: false),
    };
    current = CharacterState.quieto;
  }

  @override
  void saltar() {
    if (current != CharacterState.saltar) {
      current = CharacterState.saltar;
      speed = 0;
      position.y -= 50;
      Future.delayed(Duration(milliseconds: 500), () => position.y += 50);
      print("Arquero salta ALTO");
    }
  }

  @override
  void atacar() {
    if (current != CharacterState.atacar) {
      current = CharacterState.atacar;
      speed = 0;
      print("🏹 ARQUERO: ¡Dispara flecha!");
    }
  }

  @override
  void poderEspecial() {
    print("✨ ARQUERO: ¡Poder secreto activado!");
  }
}