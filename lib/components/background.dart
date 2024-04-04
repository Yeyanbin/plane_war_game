import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/plane_war_game.dart';

class Background extends SpriteComponent with HasGameRef<PlaneWarGame> {
  Background();

  @override
  Future<void> onLoad() async {
    print('back pre');
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
    print('back');
    // return sprite;
  }
}
