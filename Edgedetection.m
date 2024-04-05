% 1. 灰度阈值分割
Image = imread('009_71.jpg'); % 替换成实际的灰度图像文件名
gray_img = rgb2gray(Image);
threshold = graythresh(gray_img);
binaryImage = imbinarize(gray_img, threshold);

% 2. 边缘检测
gradientImage = imgradient(gray_img,'prewitt'); % 一阶梯度
robertsEdge = edge(gray_img, 'Roberts'); % Roberts算子
prewittEdge = edge(gray_img, 'Prewitt'); % Prewitt算子
sobelEdge = edge(gray_img, 'Sobel'); % Sobel算子
%kirschEdge = edge(gray_img, 'Kirsch'); % Kirsch算子
cannyEdge = edge(gray_img, 'Canny'); % Canny算子

% 显示结果
figure;

subplot(2, 3, 1), imshow(gray_img), title('Original Gray Image');
subplot(2, 3, 2), imshow(binaryImage), title('Threshold Segmentation');
subplot(2, 3, 3), imshow(gradientImage), title('One-Order Gradient');
subplot(2, 3, 4), imshow(robertsEdge), title('Roberts Edge Detection');
subplot(2, 3, 5), imshow(prewittEdge), title('Prewitt Edge Detection');
subplot(2, 3, 6), imshow(sobelEdge), title('Sobel Edge Detection');
%subplot(2, 3, 6), imshow(cannyEdge), title('Canny Edge Detection');