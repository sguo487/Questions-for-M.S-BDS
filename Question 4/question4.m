clear;
clc;

imageIn = readmatrix('input_question_4');
imageOut = findConnectedComponents(imageIn)

% visualize
figure;
subplot(2,1,1); 
imagesc(imageIn);
subplot(2,1,2); 
imagesc(imageOut);

writematrix(imageOut,'output_question_4','Delimiter','tab')