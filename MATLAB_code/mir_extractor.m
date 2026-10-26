dirName=pwd;
files = dir( fullfile(dirName,'*.wav') );
win=1;
k=1;

for f=1:length(files)
    fullFileName = fullfile(dirName, files(f).name)
    duration=mirgetdata(mirlength(miraudio(fullFileName)));
    for i=0:ceil((duration/win)-1)
        audio=miraudio(fullFileName,'Extract',i*win,(i+1)*win);
        
        
        %AF(k,1)=length(mirgetdata(mirpeaks(audio)));
        AF(k,1)=mirgetdata(mirrms(audio));
        AF(k,2)=mirgetdata(mirzerocross(audio));
        AF(k,3)=mirgetdata(mirrolloff(audio,'Threshold',0.5));
        AF(k,4)=mirgetdata(mirrolloff(audio,'Threshold',0.7));
        AF(k,5)=mirgetdata(mirbrightness(audio,'CutOff',500));
        AF(k,6)=mirgetdata(mirbrightness(audio,'CutOff',1000));
        AF(k,7)=mirgetdata(mirbrightness(audio,'CutOff',4000));
        AF(k,8)=mirgetdata(mirbrightness(audio,'CutOff',8000));
        %AF(k,10)=mirgetdata(mirregularity(audio));
      
        %statistics
        AF(k,9)=mirgetdata(mircentroid(audio));
        AF(k,10)=mirgetdata(mirspread(audio));
        AF(k,11)=mirgetdata(mirskewness(audio));
        AF(k,12)=mirgetdata(mirkurtosis(audio));
        AF(k,13)=mirgetdata(mirflatness(audio));
        %AF(k,16)=mirgetdata(mirentropy(audio));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        %timbre
        %mfccs=mirgetdata(mirmfcc(audio));
        AF(k,17)= mfccs(1);
        AF(k,18)= mfccs(2);
        AF(k,19)= mfccs(3);
        AF(k,20)= mfccs(4);
        AF(k,21)= mfccs(5);
        AF(k,22)=mfccs(6);
        AF(k,23)=mfccs(7);
        AF(k,24)=mfccs(8);
        AF(k,25)=mfccs(9);
        AF(k,26)=mfccs(10);
        AF(k,27)=mfccs(11);
        AF(k,28)=mfccs(12);
        AF(k,29)=mfccs(13);      
        
        k=k+1;
    end
end

xlswrite('Features.xls', AF);


