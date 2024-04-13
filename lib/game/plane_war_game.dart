

// class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {


import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flutter/material.dart';
import 'package:plane_war_game/components/background.dart';
import 'package:plane_war_game/components/enemy.dart';
import 'package:plane_war_game/components/bullet.dart';
import 'package:plane_war_game/components/plane_hero.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/configuration.dart';

class PlaneWarGame extends FlameGame with TapDetector, HasCollisionDetection {
  PlaneWarGame();

  late PlaneHero planeHero;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  int bulletCount = 0;
  double lastBulletTime = 0.0;
  double bulletInterval = 0.2333; // 子弹发射间隔（秒）

      // Timer attackInterval = Timer(Config.pipeInterval, repeat: true);
  @override
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
    interval.onTick = () => add(Enemy(50.2, size, Config.enemy1Imgs));
  }
  


  void update(double dt) {
    super.update(dt);
    // Update ball position to follow the pointer
    lastBulletTime += dt;
    if (lastBulletTime >= bulletInterval) {
      spawnBullet();
      lastBulletTime -= bulletInterval; // 减去发射的间隔时间，尽量减少误差
      bulletCount++;
    }
  }

  void spawnBullet() {
    final bullet = Bullet(x: planeHero.position.x + 45/2, y: planeHero.position.y );
    add(bullet);
  }

  void updatePointerPosition(Vector2 pointerPosition) {
    planeHero.position.x = pointerPosition.x - 45/2;
    planeHero.position.y = pointerPosition.y - 50/2;
    print('pointerPosition');
  }
}

// enum PlaneMovement { }
