import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:learning/2DGame/constants.dart';
// import 'package:learning/2DGame/constants.dart';
// import 'package:learning/2DGame/constants.dart';
import 'package:learning/2DGame/gameSystem/level.dart';
import 'package:learning/2DGame/gameSystem/nutty_acorn.dart';
import 'package:learning/2DGame/gameSystem/score.dart';
import 'package:learning/2DGame/sprites/acorn.dart';
import 'package:learning/2DGame/sprites/obstacle.dart';
import 'package:learning/2DGame/sprites/player.dart';

class GoAcornWorld extends World with HasGameRef<GoAcorn> {
  //khai bai biến player toàn cục để gọi nhiêu lần
  //Biến late trì hoãn việc khởi tạo một biến cho đến khi nó được sử dụng lần đầu tiên
  //biến late giá trị của biến không thể thay đổi sau khi nó được khởi tạo
  late final Player player;
  late final Score score;
  late final TextComponent scoreText;
  //gằm cờ kiểm tra xem khi nào vật cản dừng di chuyển lên
  static bool stopObstacles = false;

  GoAcornWorld(this.score);

  //tải danh sách vật cản
  void loadLevel(List<ObstacleData> levelData) {
    //loại bỏ bất kỳ vật cản nào đã có sản trên màng hình
    removeAll(children.whereType<Obstacle>().toList());

    //gán vật cản vào biến trong level
    for (var data in levelData) {
      Obstacle obstacle;
      if (data.type == ObstacleType.leaf) {
        obstacle = ObstacleLeaf()..position = data.position;
      } else if (data.type == ObstacleType.branch) {
        obstacle = ObstacleBranch()..position = data.position;
      } else if (data.type == ObstacleType.mapleleaf) {
        obstacle = ObstacleMaple()..position = data.position;
      } else if (data.type == ObstacleType.acorn) {
        obstacle = AcornSeed()..position = data.position;
      } else if (data.type == ObstacleType.ground) {
        obstacle = Ground()..position = data.position;
      } else {
        continue;
      }
      add(obstacle);
    }
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();
    // Lấy Score từ context (provider)
    // Tạo TextComponent để hiển thị điểm
    scoreText = TextComponent(
      text: 'Point: 0', // Nội dung ban đầu
      position: Vector2(300, -900), // Vị trí hiện thị điểm trên màng hình
      textRenderer: TextPaint(
          style: TextStyle(
              fontSize: 50, color: const Color.fromARGB(255, 3, 0, 0))),
    );
    add(scoreText);

    // thêm `Player` vào thế giới game (`world`)
    player = Player(world: this);
    add(player);

    //

    // thêm vật cản vào

    //vật cản cố định
    // add(ObstacleLeaf()..position = Vector2(-obstancleSize * 1.5, 0));
    // add(ObstacleBranch()..position = Vector2(obstancleSize * 1.5, 0));
    //

    //tải level vật cản
    loadLevel(LevelData().levelMain());
  }

  //làm vật cản chạy lên
  @override
  void update(double dt) {
    super.update(dt);

    //nếu "khác Thời gian trì hoản" thì thời gian trôi qua tiếp tục tăng
    if (!isDelayOver) {
      elapsedTime += dt;

      if (elapsedTime >= 1.15) {
        isDelayOver = true; // Kết thúc trì hoãn
      }
      return; // dừng trì hoãn
    }
    pointTime += dt;

    // Mỗi 2 giây, tăng điểm
    if (pointTime >= timeToIncPoint) {
      pointTime = 0; // Reset thời gian
      score.increment();
      // Cập nhật TextComponent hiển thị điểm
      scoreText.text = 'Point: ${score.score}';
    }

    // Truy cập obstacleSpeed từ GoAcorn thông qua gameRef
    double getobstaclespeed = gameRef.obstacleSpeed;
    timeSpeed += dt;
    //di chuyển hoặc dừng vật cản khi cần
    children.whereType<Obstacle>().forEach((obstacle) {
      //dừng vật cản di chuyển lên khi vật cản Ground xuất hiện trên màng hình
      if (obstacle is Ground) {
        //kiểm tra nếu vật cản cuối cùng đã xuất hiện trên màn hình
        if (obstacle.position.y <= gameRef.size.y / 2) {
          stopObstacles = true; // Dừng di chuyển vật cản
        }
      }
      //nếu stopObstacles là true thì không di chuyển vật cản nữa
      if (!stopObstacles) {
        //khi vật cản cuối cùng chưa xuất hiện
        //thì vật cản tiếp tục di chuyển
        obstacle.position.y -= (dt * getobstaclespeed);

        //từ đây là tăng tốc vật cản di chuyển tối đa là 1000(cơ bản là 400)
        if (gameRef.obstacleSpeed != 1000) {
          //cữ mỗi 5 giay thi tốc độ vật cản chạy lên tăng thêm 100
          if (timeSpeed >= 5) {
            gameRef.obstacleSpeed += 100;
            //cữ mỗi 5 giay và thời gian cộng điểm lớn hơn 0.5s thì sẽ giảm 0.2 (cở bản là 2s)
            //cái này dùng để tăng tốc nhận thêm điểm khi tốc độ game tăng lên
            if (timeToIncPoint > 0.5) {
              timeToIncPoint -= 0.25;
            }
            //chuyen timeSpeec ve 0 để tiếp t ực thực hiện dồng if này
            timeSpeed = 0;
          }
        }
      }

      // xuất hiện lại vậ cản khi chạy xông này chỉ dể thử nghiệm
      // if (obstacle.position.y < -(gameRef.size.y / 2)) {
      //   obstacle.position.y = extendedHeight;
      // }
    });

    // Cập nhật player vẫn tiếp tục rơi
    player.update(dt);
  }
}
