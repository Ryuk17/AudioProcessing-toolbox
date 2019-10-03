function [X] = getSpecgram(path)
[signal,f] = audioread(path);
signal = filter([1 -0.9375],1,signal);            % pre-emphasis
tframe = enframe(signal,hanning(2048),160);       % enframe in time domain
[tn,tm]= size(tframe);
X = zeros(tn,tm/2+1);
for i = 1:tn
	Y = fft(tframe(i,:));
	L = length(tframe(i,:));
	P2 = abs(Y);
	P1 = P2(1:L/2+1);
	X(i,:) = P1;
end
