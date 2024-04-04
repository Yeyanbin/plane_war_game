
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:plane_war_game/game/assets.dart';
import 'package:plane_war_game/game/plane_war_game.dart';
// 
class PlaneHero extends SpriteAnimationComponent
    with HasGameRef<PlaneWarGame>, CollisionCallbacks{

  // late final SpriteAnimation animation;

  PlaneHero() {
    // 在构造函数中加载动画
    // onLoad();
  }

  // @override
  // Future<void> onLoad() async {
  //   // 加载动画帧图片
  //   final images = [
  //     await gameRef.loadSprite(Assets.hero_fly1),
  //     await gameRef.loadSprite(Assets.hero_fly2),
  //     // 添加更多的图片帧...
  //   ];

  //   // 创建 SpriteAnimation 对象
  //   animation = SpriteAnimation.spriteList(images, stepTime: 0.1);
  // }

    @override
  Future<void> onLoad() async {

    size = Vector2(45, 50);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
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
    
  }



  @override
  void update(double dt) {
    // 更新动画帧
    super.update(dt);
  }
}
