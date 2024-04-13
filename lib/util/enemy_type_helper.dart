
import 'package:flame/game.dart';
import 'package:plane_war_game/game/configuration.dart';

extension EnemyRandomType on double {
  List<String> get toRandomEnemyImgs {
    if (this < 0.7) {
      return Config.enemy1Imgs;
    } else if (this < 0.9) {
      return Config.enemy2Imgs;
    } else if (this < 1) {
      return Config.enemy3Imgs;
    } else {
      // '大于1是什么鬼东西'
      throw Error();
    }
  }

  Vector2 get toRandomEnemySize {
    if (this < 0.7) {
      return Config.enemy1Size;
    } else if (this < 0.9) {
      return Config.enemy2Size;
    } else if (this < 1) {
      return Config.enemy3Size;
    } else {
      // '大于1是什么鬼东西'
      throw Error();
    }
  }
}
