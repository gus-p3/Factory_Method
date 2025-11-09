import 'package:factoty_method/main.dart';
import 'package:factoty_method/personajes/character_state.dart';
import 'package:flame/components.dart';


abstract class Personaje extends SpriteAnimationGroupComponent<CharacterState>
    with HasGameRef<MiJuegoDemo> {
  double speed = 0.0;

  abstract final double walkSpeed;
  abstract final double runSpeed;
  abstract final double walkStepTime;
  abstract final double runStepTime;

  Personaje({required Vector2 position, required Vector2 size})
      : super(position: position, size: size);

  Future<SpriteAnimation> loadAnimation(
    String fileName,
    int frameCount, {
    bool loop = true,
    double stepTime = 0.1,
  }) async {
    final spriteSheet = await game.images.load(fileName);
    final spriteSize = Vector2(spriteSheet.width / 3, spriteSheet.height / 3);
    final animationData = SpriteAnimationData.sequenced(
      amount: frameCount,
      stepTime: stepTime,
      textureSize: spriteSize,
      loop: loop,
    );
    return SpriteAnimation.fromFrameData(spriteSheet, animationData);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x += speed * dt;

    if ((current == CharacterState.atacar ||
            current == CharacterState.saltar ||
            current == CharacterState.hablar) &&
        animationTicker?.done() == true) {
      estarQuieto();
    }
  }

  void estarQuieto() {
    current = CharacterState.quieto;
    speed = 0;
  }

  void caminar() {
    current = CharacterState.caminar;
    speed = walkSpeed;
  }

  void correr() {
    current = CharacterState.correr;
    speed = runSpeed;
  }

  void saltar() {
    if (current != CharacterState.saltar) {
      current = CharacterState.saltar;
      speed = 0;
      position.y -= 20;
      Future.delayed(Duration(milliseconds: 500), () => position.y += 20);
      print("Personaje salta (default)");
    }
  }

  Component get component => this;
}

abstract class PersonajeJugable extends Personaje {
  PersonajeJugable({required super.position, required super.size});

   void atacar();
   void poderEspecial();
}

abstract class NPC extends Personaje {
  NPC({required super.position, required super.size});

   void hablar();
}