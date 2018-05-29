function [landmark] = getLandmark(path)
[data,f] = audioread(path);
data = filter([1 -0.9375],1,data);                % pre-emphisi
signal = data(1:8000);                            % take 1s sample
tframe = enframe(signal,hanning(1024),80);        % enframe in time domain,hanning window of length 1024 samples,the non-overlapped length  is 80 samples
[tn,tm]= size(tframe);
X = zeros(tn,tm/2+1);
for i = 1:tn
	Y = fft(tframe(i,:));
	L = length(tframe(i,:));
	P2 = 20*log10(abs(Y/L));
	P1 = P2(1:L/2+1);
	X(i,:) = P1;
end
                                                  % calcuate landmark
landmark = getLocalMaximun(X,32,64,1);
