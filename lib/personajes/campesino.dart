import 'package:factoty_method/personajes/character_state.dart';
import 'package:factoty_method/personajes/personaje.dart';
import 'package:flame/components.dart';

class Campesino extends NPC {
  @override
  final double walkSpeed = 60.0;
  @override
  final double runSpeed = 120.0;
  @override
  final double walkStepTime = 0.15;
  @override
  final double runStepTime = 0.08;

  Campesino({required Vector2 position})
      : super(position: position, size: Vector2(100, 100));

  @override
  Future<void> onLoad() async {
    animations = {
      CharacterState.quieto: await loadAnimation('campesino_idle.png', 9,
          stepTime: walkStepTime),
      CharacterState.caminar: await loadAnimation('campesino_walk.png', 9,
          stepTime: walkStepTime),
      CharacterState.correr:
          await loadAnimation('campesino_walk.png', 9, stepTime: runStepTime),
      CharacterState.saltar:
          await loadAnimation('campesino_idle.png', 9, loop: false),
      CharacterState.hablar:
          await loadAnimation('campesino_idle.png', 9, loop: false),
    };
    current = CharacterState.quieto;
  }

  @override
  void hablar() {
    if (current != CharacterState.hablar) {
      current = CharacterState.hablar;
      speed = 0;
      print("CAMPESINO: He oído que el dragón guarda su tesoro al este...");
    }
  }
}