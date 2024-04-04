import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:plane_war_game/game/plane_war_game.dart';
// import 'package:flappy_bird_game/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'screens/game_over_screen.dart';

Future<void> main() async {
  print('main start');


  // 设置系统UI覆盖样式，这里将状态栏颜色设置为透明。
  SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // 确保 Flutter 绑定已经初始化。
  WidgetsFlutterBinding.ensureInitialized();

  // 使用 Flame 提供的 device 功能使应用程序进入全屏模式。
  await Flame.device.fullScreen();
  
  // 创建Flappy Bird 游戏的实例 
  print('game start');
  // 启动app
  runApp(
    MyGame()
  );
}

class MyGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final game = PlaneWarGame();


    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanUpdate: (details) {
        var pointerPosition = details.localPosition;
        // 将指针位置传递给游戏组件
        print('pointerPosition in MyGame');
        game.updatePointerPosition(pointerPosition.toVector2());
      },
      child:
        // 游戏组件
        GameWidget(
          game: game
          // 指定了游戏启动时要显示的初始叠加层，这里指定为主菜单屏幕。
          // initialActiveOverlays: const [MainMenuScreen.id],
          // 指定了不同叠加层的构建器，用于根据需要构建不同的叠加层。在这里，指定了 mainMenu 和 gameOver 两个叠加层的构建器。
          // overlayBuilderMap: {
            // 'mainMenu': (context, _) => MainMenuScreen(game: game),
            // 'gameOver': (context, _) => GameOverScreen(game: game),
          // },
        ),
    );
  }
}