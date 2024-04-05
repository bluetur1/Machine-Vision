% 图像参数
image_width = 640;
image_height = 480;
pixel_size = 8e-3; % 像素尺寸，单位mm

% 相机参数
focal_length = 8; % 焦距，单位mm
baseline = 0.55; % 机器人眼睛中心到地面距离，单位m

% 相机中心坐标
u0 = image_width / 2;
v0 = image_height / 2;

% 俯仰角（根据提供的俯仰角表，这里假设角度为40度）
pitch_angle = 40;

% 转换俯仰角为弧度
pitch_angle_rad = deg2rad(pitch_angle);

% 假设已有足球位置，用x_pixel, y_pixel表示
x_pixel = 220; % 假设足球中心在图像的x坐标
y_pixel = 300; % 假设足球中心在图像的y坐标
% 计算深度
depth = (focal_length * baseline) / (v0 - y_pixel);

% 计算相机坐标系下的位置
X_camera = (depth / focal_length) * (x_pixel - u0) * pixel_size;
Y_camera = (depth / focal_length) * (y_pixel - v0) * pixel_size;
Z_camera = depth;

% 由于存在俯仰角，需要根据俯仰角调整Z坐标
Z_camera_adjusted = Z_camera / cos(pitch_angle_rad);

% 显示结果
disp('足球在相机坐标系中的位置:');
disp([X_camera, Y_camera, Z_camera_adjusted]);
