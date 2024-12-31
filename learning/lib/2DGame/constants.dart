//Độ phân giải HD 9x16
//chiều rộng màng hinh
const gameWidth = 1080.0;
//chiều cao màng hinh
const gameHeight = 1920.0;

//size vật cản
const obstancleSize = 210.0;

//size cho player
const playerWidth = 200.0;
const playerHeight = 150.0;

double elapsedTime = 0.0; //tại biến lưu thời gian đã qua
bool isDelayOver = false; //gắn cờ đánh dấu trì hoãn thời gian
double pointTime = 0.0; //biến này để tính điểm
double timeSpeed =
    0.0; //biến này để tăng hoạt động của game để tăng tốc độ chơi
double timeToIncPoint = 2.0;
