clear;
clf;
threshold=12;
[y,yfs]=audioread('yes1.wav');


Fs=yfs;
ylength=length(y);
deltaf=Fs/ylength;
k1=5000/deltaf;
k1r=round(k1);

k2=11025/deltaf;
k2r=round(k2);

yfft=fft(y);
yabs=abs(yfft);
sumf=sum(yabs(1:k1r));
sumf2=sum(yabs(k1r:k2r));
sumf3=sumf/sumf2;


disp('The spoken word is:')
if sumf3 < threshold
disp('Yes')
elseif sumf3 > threshold
disp('No')
end


periodogram(y,[],length(y),yfs);
