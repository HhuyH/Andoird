import 'dart:math';
import 'package:flame/components.dart';
import 'package:learning/2DGame/constants.dart';

enum ObstacleType {
  leaf,
  branch,
  mapleleaf,
  birh,
  acorn,
  ground,
}

class ObstacleData {
  final Vector2 position;
  final ObstacleType type;

  ObstacleData({required this.position, required this.type});
}

class LevelData {
  final obstacleSpacing = obstancleSize + (playerHeight * 2);
  final leftSide = -(gameWidth / 2) + (obstancleSize / 2);
  final rightSide = (gameWidth / 2) - (obstancleSize / 2);
  final random = Random();
  //level test chỉ có vài cái để test
  List<ObstacleData> levelTest() {
    List<ObstacleData> level = [];

    //tạo danh sách chưa vật cản từng hàm là tượng chứng một đoạn vật cản
    //đã chia size vừa đủ để chứa 5 item cho 1 hàng vì vậy tối đa là 5 vật cản 1 hàng
    level.addAll(obstacleRow(
      row: 0,
      item1: ObstacleType.leaf,
      item2: ObstacleType.mapleleaf,
      item4: ObstacleType.branch,
      item5: ObstacleType.leaf,
    ));

    level.addAll(obstacleRow(
      row: 1,
      item1: ObstacleType.leaf,
      item2: ObstacleType.leaf,
      item3: ObstacleType.mapleleaf,
      item5: ObstacleType.branch,
    ));

    level.addAll(obstacleRow(
      row: 2,
      item1: ObstacleType.branch,
      item2: ObstacleType.birh,
      item3: ObstacleType.branch,
      item4: ObstacleType.leaf,
    ));

    level.addAll(obstacleRow(
      row: 4,
      item1: ObstacleType.branch,
      item3: ObstacleType.branch,
      item4: ObstacleType.leaf,
      item5: ObstacleType.birh,
    ));

    level.addAll(obstacleRow(
      row: 5,
      item1: ObstacleType.branch,
      item2: ObstacleType.birh,
      item4: ObstacleType.mapleleaf,
      item5: ObstacleType.birh,
    ));

    level.addAll(obstacleRow(
      row: 6,
      item1: ObstacleType.branch,
      item2: ObstacleType.birh,
      item3: ObstacleType.leaf,
    ));

    level.addAll(obstacleRow(
      row: 7,
      item3: ObstacleType.birh,
      item4: ObstacleType.leaf,
      item5: ObstacleType.mapleleaf,
    ));

    level.addAll(obstacleRow(
      row: 8,
      item1: ObstacleType.branch,
      item2: ObstacleType.birh,
      item3: ObstacleType.branch,
      item5: ObstacleType.birh,
    ));

    level.addAll(obstacleRow(
      row: 9,
      item2: ObstacleType.birh,
      item4: ObstacleType.leaf,
      item5: ObstacleType.birh,
    ));

    level.addAll(obstacleRow(
      row: 10,
      item1: ObstacleType.mapleleaf,
      item3: ObstacleType.branch,
      item4: ObstacleType.leaf,
    ));

    level.addAll(obstacleRow(
      row: 11,
      item2: ObstacleType.birh,
      item3: ObstacleType.branch,
      item5: ObstacleType.leaf,
    ));

    // đích để kết thức game thắng
    level.addAll(obstacleRow(
      row: 12,
      item3: ObstacleType.acorn,
    ));

    // đích để kết thức game thua
    //chạm đất
    final yPositionRow13 =
        obstacleSpacing * 13 - obstancleSize; // Điều chỉnh vị trí y
    level.addAll(obstacleRowCustomY(
      yPosition: yPositionRow13,
      item1: ObstacleType.ground,
      item2: ObstacleType.ground,
      item3: ObstacleType.ground,
      item4: ObstacleType.ground,
      item5: ObstacleType.ground,
    ));

    return level;
  }

  //level random level chinh cua game
  List<ObstacleData> levelMain() {
    List<ObstacleData> level = [];
    int maxrow = 40;
    // tạo ngẩu nhiên theo dồng
    for (int row = 3; row <= maxrow; row++) {
      final generatedItems = randomRowObstacles();
      level.addAll(obstacleRow(
        row: row,
        item1: generatedItems[0],
        item2: generatedItems[1],
        item3: generatedItems[2],
        item4: generatedItems[3],
        item5: generatedItems[4],
      ));
    }

    //tạo 10 dồng cuối tùy trình
    for (int row = 41; row <= 50; row++) {
      if (row == 41) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 42) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item3: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 43) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 44) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item3: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 45) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item3: ObstacleType.branch,
          item4: ObstacleType.branch,
        ));
      } else if (row == 46) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item3: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 47) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 48) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item3: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 49) {
        level.addAll(obstacleRow(
          row: row,
          item2: ObstacleType.birh,
          item3: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      } else if (row == 50) {
        level.addAll(obstacleRow(
          row: row,
          item1: ObstacleType.branch,
          item2: ObstacleType.branch,
          item4: ObstacleType.branch,
          item5: ObstacleType.branch,
        ));
      }
    }

    int customrow = maxrow + 12;
    // đặt đích đến ở vị trí cuối cũng của random

    //đặt acorn ngau nhien trong 5 vi tri o hang ke cuoi trong random
    final endBinSpace = random.nextInt(5) + 1;
    level.addAll(obstacleRow(
      row: customrow + 1,
      item1: endBinSpace == 1 ? ObstacleType.acorn : null,
      item2: endBinSpace == 2 ? ObstacleType.acorn : null,
      item3: endBinSpace == 3 ? ObstacleType.acorn : null,
      item4: endBinSpace == 4 ? ObstacleType.acorn : null,
      item5: endBinSpace == 5 ? ObstacleType.acorn : null,
    ));
    //đích để kết thức game -> thua
    //chạm đất
    final yPositionRow13 = obstacleSpacing * (customrow + 2) -
        obstancleSize; // Điều chỉnh vị trí y xuất hiện
    level.addAll(obstacleRowCustomY(
      yPosition: yPositionRow13,
      item1: ObstacleType.ground,
      item2: ObstacleType.ground,
      item3: ObstacleType.ground,
      item4: ObstacleType.ground,
      item5: ObstacleType.ground,
    ));
    return level;
  }

  List<ObstacleType?> randomRowObstacles() {
    final availableObjects = [
      ObstacleType.leaf,
      ObstacleType.branch,
      ObstacleType.mapleleaf,
    ];

    // Tạo danh sách vật cản với 5 phần tử, khởi tạo tất cả là null
    List<ObstacleType?> result = [null, null, null, null, null];

    // Điền các vật cản khác vào các vị trí còn lại (trừ vị trí đã có branch)
    for (int i = 0; i < result.length; i++) {
      if (result[i] == null) {
        // Tạo danh sách vật cản không bao gồm branch nếu là một trong các vị trí không mong muốn
        List<ObstacleType> filteredObjects = List.from(availableObjects);

        //không cho branch xuất hiện ở vị trí 1 2 3
        if (i == 1 || i == 2 || i == 3) {
          filteredObjects
              .remove(ObstacleType.branch); //xóa branch khỏi danh sách
          // Đặt branch ở item1 hoặc item5 và các item tiếp theo
          if (result[0] == ObstacleType.branch) {
            result[1] = ObstacleType.branch;
            if (result[1] == ObstacleType.branch) {
              result[2] = ObstacleType.branch;
            }
          } else if (result[4] == ObstacleType.branch) {
            result[3] = ObstacleType.branch;
            if (result[3] == ObstacleType.branch) {
              result[2] = ObstacleType.branch;
            }
          }
        }

        // Chọn ngẫu nhiên một vật cản khác
        int randomIndex = random.nextInt(filteredObjects.length);
        result[i] = filteredObjects[randomIndex];
      }
    }

    // Đảm bảo có ít nhất một khoảng trống (null) trong mỗi hàng
    if (!result.contains(null)) {
      // Nếu không có khoảng trống, thay thế một vật cản ngẫu nhiên bằng null
      int replaceIndex = random.nextInt(result.length);
      result[replaceIndex] = null;
    }

    return result;
  }

  // thiết lập vị trí cho các vật cản cơ bản
  List<ObstacleData> obstacleRow({
    required int row,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];
    final yPosition = obstacleSpacing * row;

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide, yPosition),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide + (gameWidth / 5), yPosition),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(0, yPosition),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide - (gameWidth / 5), yPosition),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide, yPosition),
          type: item5,
        ),
      );
    }

    return content;
  }

  // thiết lập vật cản nền đat61
  List<ObstacleData> obstacleRowCustomY({
    required double yPosition,
    ObstacleType? item1,
    ObstacleType? item2,
    ObstacleType? item3,
    ObstacleType? item4,
    ObstacleType? item5,
  }) {
    List<ObstacleData> content = [];

    if (item1 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide, yPosition),
          type: item1,
        ),
      );
    }
    if (item2 != null) {
      content.add(
        ObstacleData(
          position: Vector2(leftSide + (gameWidth / 5), yPosition),
          type: item2,
        ),
      );
    }
    if (item3 != null) {
      content.add(
        ObstacleData(
          position: Vector2(0, yPosition),
          type: item3,
        ),
      );
    }
    if (item4 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide - (gameWidth / 5), yPosition),
          type: item4,
        ),
      );
    }
    if (item5 != null) {
      content.add(
        ObstacleData(
          position: Vector2(rightSide, yPosition),
          type: item5,
        ),
      );
    }

    return content;
  }
}
