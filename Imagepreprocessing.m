
% 2. 图像滤波处理（邻域平均）
originalImage = imread('009_71.jpg'); % 图像文件名
filteredImage = imfilter(originalImage, fspecial('average', [3, 3]));

% 3. RGB到HSI颜色空间转换和目标扫描、定位
hsvImage = rgb2hsv(originalImage);
hueChannel = hsvImage(:, :, 1);

% 假设足球颜色在HSI颜色空间中的范围是[0.1, 0.4]，标志线颜色在[0.5, 0.7]
footballMask = (hueChannel >= 0.1) & (hueChannel <= 0.4);
goalMask = (hueChannel >= 0.5) & (hueChannel <= 0.7);

% 在原始图像上显示目标区域
imshow(originalImage);
hold on;
visboundaries(footballMask, 'Color', 'r');
visboundaries(goalMask, 'Color', 'b');
hold off;

% 4. RGB到灰度图像转换
grayImage = rgb2gray(originalImage);

% 图像增强（直方图均衡化）
enhancedImage = histeq(grayImage);

% 显示原始图像、滤波后图像、目标定位图像、灰度图像和增强图像
figure;
subplot(2, 3, 1), imshow(originalImage), title('Original Image');
subplot(2, 3, 2), imshow(filteredImage), title('Filtered Image');
subplot(2, 3, 3), imshow(originalImage), hold on;
visboundaries(footballMask, 'Color', 'r');
visboundaries(goalMask, 'Color', 'b');
hold off;
title('Object Localization');
subplot(2, 3, 4), imshow(grayImage), title('Grayscale Image');
subplot(2, 3, 5), imshow(enhancedImage), title('Enhanced Image');
