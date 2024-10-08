import 'package:flame/game.dart';
import 'package:plane_war_game/components/enemy_prop.dart';
import 'package:plane_war_game/game/assets.dart';

class Config {
  static const groundHeight = 110.0;
  static const gameSpeed = 200.0;
  static const pipeInterval = 1.5;
  static const birdVelocity = 210;
  static const gravity = -100.0;
  static const cloudsHeight = 70.0;
  static const enemy1Imgs = [
    Assets.enemy1_fly1
  ];
  static const enemy2Imgs = [
    Assets.enemy2_fly1
  ];
  static const enemy3Imgs = [
    Assets.enemy3_fly1,
    Assets.enemy3_fly2
  ];
  static final enemy1Size = Vector2(40, 40);
  static final enemy2Size = Vector2(80, 90);
  static final enemy3Size = Vector2(120, 150);
  static const enemySpeed = 100.0;
  static const enemy1Speed = 90.0;
  static const enemy2Speed = 70.0;
  static const enemy3Speed = 50.0;

  static final enemy1 = EnemyProp(
    imgList: [
      Assets.enemy1_fly1
    ], 
    size: Vector2(40, 40),
    score: 1,
    hp: 10,
    speed: 90,
  );
    static final enemy2 = EnemyProp(
    imgList: [
      Assets.enemy2_fly1
    ], 
    size: Vector2(80, 90),
    score: 10,
    hp: 50,
    speed: 70,
  );
    static final enemy3 = EnemyProp(
    imgList: [
      Assets.enemy3_fly1,
      Assets.enemy3_fly2
    ],
    size: Vector2(120, 150),
    score: 100,
    hp: 200,
    speed: 50,
  );
}
