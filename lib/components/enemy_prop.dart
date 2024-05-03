

import 'package:flame/game.dart';

class EnemyProp {
  final List<String> imgList;
  final double speed;
  final double hp;
  final Vector2 size;
  final double score;

  EnemyProp({
    required this.imgList,
    this.speed = 50,
    this.hp = 10,
    required this.size,
    this.score = 10
  });
}