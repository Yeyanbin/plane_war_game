import 'package:flappy_bird_game/game/assets.dart';
import 'package:flappy_bird_game/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;

  const GameOverScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.black38,
    child: Center( // 居中
      child: Column( // 列表
        mainAxisSize: MainAxisSize.min, // MainAxisSize.min 表示主轴方向上的尺寸尽可能小。
        children: [
          Text(
            'Score: ${game.bird.score}',
            style: const TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontFamily: 'Game',
            ),
          ),
          // 创建一个高度为 20 像素的空白区域
          const SizedBox(height: 20),
          // 插入图片
          Image.asset(Assets.gameOver),
          const SizedBox(height: 20),
          // 按钮
          ElevatedButton(
            onPressed: onRestart, // 点击后的方法
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text(
              'Restart',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  );

  void onRestart() {
    // 当重新开始按钮被点击时触发。
    game.bird.reset();
    game.overlays.remove('gameOver'); // 移除叠加层
    game.resumeEngine(); // 恢复游戏引擎的运行。
    // 它会启动游戏引擎的主循环（game loop），使得游戏可以继续更新、渲染和响应事件。
    // 一旦调用了 game.resumeEngine()，游戏将继续进行，玩家可以继续操作并参与游戏。
  }
}
