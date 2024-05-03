import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:plane_war_game/components/enemy_prop.dart';
import 'package:plane_war_game/util/abstract_util.dart';
import 'package:plane_war_game/game/plane_war_game.dart';

class Enemy extends SpriteAnimationComponent
    with HasGameRef<PlaneWarGame>, CollisionCallbacks
    implements IsEnemy {

  @override
  late String id;
  late final double x;
  late double hp; // 血量属性
  late final EnemyProp enemyData;

  Enemy({
    required this.enemyData,
    required this.x,
    required this.id
  }) 
  : super(size: enemyData.size);

  @override
  Future<void> onLoad() async {
    position.x = x;
    position.y = 0;
    hp = enemyData.hp;

    final images = await Future.wait(enemyData.imgList.map((item) => 
      gameRef.loadSprite(item)
    ));

    animation = SpriteAnimation.spriteList(images, stepTime: 0.1);
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    // 检查另一个组件是否具有 damage 属性
    if (other is HasDamage) {
      // 获取另一个组件的 damage 属性，并根据它来计算血量
      double damage = (other as HasDamage).damage;
      hp -= damage;
      
      // 根据游戏逻辑处理血量更新后的情况
      if (hp <= 0) {
        // 如果血量小于等于 0，执行死亡逻辑
        die();
      } else {
        // 如果血量大于 0，执行受伤逻辑
        takeDamage();
      }
    }
  }
  
  void die() {
    // 死亡逻辑
    // print('die');
    // 记分和销毁
    gameRef.addScore(enemyData.score);
    gameRef.removeEnemy(id);
    removeFromParent();
  }

  void clear() {
    removeFromParent();
  }

  void takeDamage() {
    // 受伤逻辑
    // print('takeDamage');
  }

  @override
  void update(double dt) {
    // 更新动画帧
    super.update(dt);

    position.y += enemyData.speed * dt;

    if (position.y > gameRef.size.y + 10) {
      removeFromParent();
      print('超出边界销毁');
    }
  }
}
