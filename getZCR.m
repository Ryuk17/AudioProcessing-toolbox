function zcr = getZCR(wavName)
signal = audioread(wavName);
framelength = 240;                                                % the length of each frame
framenumber = fix(length(signal)/framelength);  
for i = 1:framenumber;                                            % enframe 
    framesignal = signal((i-1)*framelength+1:i*framelength);      % take one frame signal 
    zcr(i) = 0;  
    for j = 2:framelength-1;                                      % calcuate the times of zero-crossing 
       	 zcr(i) = zcr(i) + abs(sgn(framesignal(j))-sgn(framesignal(j-1)));
        end
    end  
zcr = zcr/(2*framelength);                                         % calcuate the ratio 
end   
