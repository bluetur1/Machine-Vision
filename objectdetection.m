% 读取图像
image = imread('009_71.jpg');

% 转换为灰度图像
grayImage = rgb2gray(image);

% 进行边缘检测
edgeImage = edge(grayImage, 'Sobel');
imshow(edgeImage);
hold on;
% 使用 Hough 变换检测直线
[H, theta, rho] = hough(edgeImage);
peaks = houghpeaks(H, 5); % 选择峰值点
lines = houghlines(edgeImage, theta, rho, peaks);

% 绘制检测到的直线
figure; imshow(grayImage); hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'r');
end
hold off;


%定位 足球
% 读取图像
image = imread('009_71.jpg');

% 转换为灰度图像
grayImage = rgb2gray(image);

% 进行边缘检测
edgeImage = edge(grayImage, ['Sobel']);
imshow(edgeImage);
hold on;
% 使用 Hough 变换检测圆
[centers, radii] = imfindcircles(edgeImage, [10 50]); % 调整半径范围
   
% 绘制检测到的圆
figure; imshow(grayImage); hold on;
viscircles(centers, radii, 'EdgeColor', 'r');
hold off;

