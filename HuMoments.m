clc;
clear all;
close all;
% %---------------------------   Hu's Moment   ---------------------------- %

resim=input('Please enter number for desired object image\n 1:Duck\n 2:Tennis Ball\n 3:Candy Box\n 4:Cameraman\n 5:Butterfly\n 6:Planes\n');
img = imread(sprintf('%d.png',resim));
[row,col,channel]=size(img);

if channel==3
    img=double(rgb2gray(img));
else
    img=double(img);
end

figure (1)
imshow(uint8(img)), title('Original Image')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
R300d=imrotate(img,300); 
R240d=imrotate(img,240);
R180d=imrotate(img,180);
R120d=imrotate(img,120);
R60d=imrotate(img,60);

figure (2)
subplot(2,3,1), imshow(uint8(img)), title('Original Image');
subplot(2,3,2), imshow(uint8(R60d)), title('60 degrees rotated image');
subplot(2,3,3), imshow(uint8(R120d)), title('120 degrees rotated image');
subplot(2,3,4), imshow(uint8(R180d)), title('180 degrees rotated image');
subplot(2,3,5), imshow(uint8(R240d)), title('240 degrees rotated image');
subplot(2,3,6), imshow(uint8(R300d)), title('300 degrees rotated image');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);

original_moment=HUinvariant(img);        Tr_original_moment=original_moment';
R60d_moment    = HUinvariant(R60d);      Tr_R60d_moment=R60d_moment' ;
R120d_moment   = HUinvariant(R120d);     Tr_R120d_moment=R120d_moment';
R180d_moment   = HUinvariant(R180d);     Tr_R180d_moment=R180d_moment';
R240d_moment   = HUinvariant(R240d);     Tr_R240d_moment=R240d_moment';
R300d_moment   = HUinvariant(R300d);     Tr_R300d_moment=R300d_moment';

MOM=table(Tr_original_moment,Tr_R60d_moment,Tr_R120d_moment,Tr_R180d_moment,Tr_R240d_moment,Tr_R300d_moment);

% Normalizing meaningless values

N_original_moment=-sign(original_moment).*log10(abs(original_moment));
N_R60d_moment    =-sign(R60d_moment)    .*log10(abs(R60d_moment)    );
N_R120d_moment   =-sign(R120d_moment)   .*log10(abs(R120d_moment)   );
N_R180d_moment   =-sign(R180d_moment)   .*log10(abs(R180d_moment)   );
N_R240d_moment   =-sign(R240d_moment)   .*log10(abs(R240d_moment)   );
N_R300d_moment   =-sign(R300d_moment)   .*log10(abs(R300d_moment)   );

Tr_N_original_moment=N_original_moment';
Tr_N_R60d_moment=N_R60d_moment';
Tr_N_R120d_moment=N_R120d_moment';
Tr_N_R180d_moment=N_R180d_moment';
Tr_N_R240d_moment=N_R240d_moment';
Tr_N_R300d_moment=N_R300d_moment';

NormalizedMoments=table(Tr_N_original_moment,Tr_N_R60d_moment,Tr_N_R120d_moment,Tr_N_R180d_moment,Tr_N_R240d_moment,Tr_N_R300d_moment);
NormalizedMomentsArray(:,1)=Tr_N_original_moment;
NormalizedMomentsArray(:,2)=Tr_N_R60d_moment;
NormalizedMomentsArray(:,3)=Tr_N_R120d_moment;
NormalizedMomentsArray(:,4)=Tr_N_R180d_moment;
NormalizedMomentsArray(:,5)=Tr_N_R240d_moment;
NormalizedMomentsArray(:,6)=Tr_N_R300d_moment;