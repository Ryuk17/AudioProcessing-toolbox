function [E] = getEnergy(path)
[signal,fs] = audioread(path);                                 
framelength = 240;                                          % set length of window  
framenumber = fix(length(signal)/framelength);              %    
for i = 1:framenumber;                                      % enframe   
    framesignal = signal((i-1)*framelength+1:i*framelength);
    E(i) = 0;                                                 
    for j = 1:framelength;                                  % calcuate energy of each frame   
        E(i) = E(i)+framesignal(j)^2;    
    end    
end 
