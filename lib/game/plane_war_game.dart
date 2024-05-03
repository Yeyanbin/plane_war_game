

// class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {


import 'package:flame/components.dart';
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
import 'package:plane_war_game/util/math.dart';
import 'package:plane_war_game/util/enemy_type_helper.dart';


class PlaneWarGame extends FlameGame with TapDetector, HasCollisionDetection {
  PlaneWarGame();

  late PlaneHero planeHero;
  Timer enemyInterval = Timer(Config.pipeInterval, repeat: true);

  int bulletCount = 0;
  double lastBulletTime = 0.0;
  double bulletInterval = 0.3; // 子弹发射间隔（秒）
  late TextComponent scoreText; // 分数
  double score = 0;

  @override
  Future<void> onLoad() async {

    /*
    addAll 方法是 Flutter Flame 游戏引擎中 BaseGame 类的方法之一，用于一次性将多个组件添加到游戏中。
    这里用于将游戏中的多个组件添加到 FlappyBirdGame 中。
    */
    print('add back');
    addAll([
      Background(),
      planeHero = PlaneHero(),
      scoreText = buildScore(),
    ]);

    // interval计时器每次触发时都xx会添加一个新的 PipeGroup 到游戏中。
    enemyInterval.onTick = addEnemy;
  }
  
  void addEnemy() {
    final enemyRandomNumber = getRandomNumber();
    final enemyData = enemyRandomNumber.toRandomEnemyProp;

    var x = getRandomNumber(min: enemyData.size.x, max: size.x - enemyData.size.x);
    // print('add Enemy ${size.y} x: ${x}');
    add(Enemy(enemyData: enemyData, x: x));
  }


  @override
  void update(double dt) {
    super.update(dt);
    enemyInterval.update(dt);

    lastBulletTime += dt;
    if (lastBulletTime >= bulletInterval) {
      spawnBullet();
      lastBulletTime -= bulletInterval; // 减去发射的间隔时间，尽量减少误差
      bulletCount++;
    }
    scoreText.text = 'Score: ${score.toString()}';
  }

  void spawnBullet() {
    final bullet = Bullet(x: planeHero.position.x + 45/2, y: planeHero.position.y );
    add(bullet);
  }

  void updatePointerPosition(Vector2 pointerPosition) {
    planeHero.position.x = pointerPosition.x - 45/2;
    planeHero.position.y = pointerPosition.y - 50/2;
  }
  
  TextComponent buildScore() {
    // 返回一个文本组件
    return TextComponent(
        position: Vector2(size.x / 2, size.y / 2 * 0.2), // Vector2 对象用于描述方向向量
        anchor: Anchor.center,
        textRenderer: TextPaint( // 绘制文本
          style: const TextStyle(
              fontSize: 40, fontFamily: 'Game', fontWeight: FontWeight.bold),
        ));
  }

  void addScore(double score) {
    print('add score ${score}');
    this.score += score;
  }
}


