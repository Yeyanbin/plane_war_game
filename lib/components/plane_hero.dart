
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/plane_war_game.dart';

import '../util/abstract_util.dart';
// 
class PlaneHero extends SpriteAnimationComponent
    with HasGameRef<PlaneWarGame>, CollisionCallbacks{

  PlaneHero();

  @override
  Future<void> onLoad() async {

    size = Vector2(45, 50);
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y / 2 *1.6 - size.y / 2);
    // 加载动画帧图片
    final images = [
      await gameRef.loadSprite(Assets.hero_fly1),
      await gameRef.loadSprite(Assets.hero_fly2),
      // 添加更多的图片帧...
    ];
    print(images);
    // 创建 SpriteAnimation 对象
    animation = SpriteAnimation.spriteList(images, stepTime: 0.1);
    print(animation);
    add(RectangleHitbox());
  }

    // 重制
  void reset() {
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y / 2 *1.6 - size.y / 2);
    game.score = 0;
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is IsEnemy) {
      gameOver();
    }
  }

  void gameOver() {
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }

  @override
  void update(double dt) {
    // 更新动画帧
    super.update(dt);
  }
}
