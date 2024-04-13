
import 'dart:ffi';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/configuration.dart';
import 'package:plane_war_game/game/plane_war_game.dart';
// 
class Enemy extends SpriteAnimationComponent
    with HasGameRef<PlaneWarGame>, CollisionCallbacks{

  // late final SpriteAnimation animation;
  late final List<String> enemyImgs;
  late final double x;

  Enemy(this.x, Vector2 size, this.enemyImgs) 
  : super(size: size);

  @override
  Future<void> onLoad() async {
    print('bullet loading ${x}');
    position.x = x;
    position.y = 0;

    final images =  await Future.wait(enemyImgs.map((item) => gameRef.loadSprite(item)));

    print(images);
    // 创建 SpriteAnimation 对象
    animation = SpriteAnimation.spriteList(images, stepTime: 0.1);
    print(animation);
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    // 更新动画帧
    super.update(dt);

    position.y += Config.enemySpeed * dt;
  }
}
