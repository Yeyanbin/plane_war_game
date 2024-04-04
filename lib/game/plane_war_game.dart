

// class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {


import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:plane_war_game/components/background.dart';
import 'package:plane_war_game/components/plane_hero.dart';
import 'package:plane_war_game/game/configuration.dart';

class PlaneWarGame extends FlameGame with TapDetector, HasCollisionDetection {
  PlaneWarGame();

  late PlaneHero planeHero;

      // Timer attackInterval = Timer(Config.pipeInterval, repeat: true);
  Future<void> onLoad() async {

    /*
    addAll 方法是 Flutter Flame 游戏引擎中 BaseGame 类的方法之一，用于一次性将多个组件添加到游戏中。
    这里用于将游戏中的多个组件添加到 FlappyBirdGame 中。
    */
    print('add back');
    addAll([
      Background(),
      // Ground(),
      planeHero = PlaneHero(),
      // score = buildScore(),
    ]);
    // add(Background());

    // interval计时器每次触发时都xx会添加一个新的 PipeGroup 到游戏中。
    // interval.onTick = () => add(PipeGroup());
  }
  


  void update(double dt) {
    super.update(dt);
    // Update ball position to follow the pointer
    // if (pointer != null) {
    //   planeHero.position = pointer!.position;
    // }
  }

  void updatePointerPosition(Vector2 pointerPosition) {
    planeHero.position.x = pointerPosition.x - 45/2;
    planeHero.position.y = pointerPosition.y - 50/2;
    print('pointerPosition');
  }
}

// enum PlaneMovement { }
