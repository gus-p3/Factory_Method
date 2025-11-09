import 'package:factoty_method/personajes/arquero.dart';
import 'package:factoty_method/personajes/caballero.dart';
import 'package:factoty_method/personajes/campesino.dart';
import 'package:factoty_method/personajes/personaje.dart';
import 'package:flame/components.dart';

abstract class FactoryPersonaje {
  Personaje createPersonaje(Vector2 position);
}

class FactoryArquero extends FactoryPersonaje {
  @override
  Personaje createPersonaje(Vector2 position) {
    return Arquero(position: position);
  }
}

class FactoryCaballero extends FactoryPersonaje {
  @override
  Personaje createPersonaje(Vector2 position) {
    return Caballero(position: position);
  }
}

class FactoryNPC extends FactoryPersonaje {
  @override
  Personaje createPersonaje(Vector2 position) {
    return Campesino(position: position);
  }
}