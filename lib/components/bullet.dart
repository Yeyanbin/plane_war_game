import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:plane_war_game/util/abstract_util.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/plane_war_game.dart';

/**
 * 子弹组件，有基本的属性，位置速度伤害
 */

class Bullet extends SpriteComponent with HasGameRef<PlaneWarGame>, CollisionCallbacks implements HasDamage {
  @override
  double damage;

  Bullet({
    this.damage = 10,
    required this.x,
    required this.y,
  });

  @override
  final double x;
  @override
  final double y;

  static double buttetSpeed = 200;

  @override
  Future<void> onLoad() async {
    final bullet = await gameRef.loadSprite(Assets.bullet);
    size = Vector2(10, 20);
    position = Vector2(x - 5, y - 20);
    sprite = bullet;
    // 增加碰撞检测
    add(RectangleHitbox());
  }

    @override
  void update(double dt) {
    super.update(dt);
    if (position.y > 0) {
      position.y -= buttetSpeed * dt;
    } else {
      removeFromParent();
    }

  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    print('onCollisionStart 子弹');

    if (other is IsEnemy) {
      removeFromParent();
    }
  }
}