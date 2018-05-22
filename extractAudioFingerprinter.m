function [F] = extractAudioFingerprint( path )
% path：the path of audio sample
% F: the audio fingerprinter of audio sample
[data,f] = audioread(path);
data = filter([1 -0.9375],1,data);                             % pre-emphasis
signal = data(1:3*f);                                          % take a audio of length 3s from sample
tframe = enframe(signal,hanning(2048),80);                     % enframe in time domain,hanning window of length 2048 smaples,the non-overlapped length is 80 samples
[tn,tm]= size(tframe);
E = zeros(tn,33);
F = zeros(tn,32);
for i = 1:tn
	Y = fft(tframe(i,:));
	L = length(tframe(i,:));
	P2 = abs(Y/L);
	P1 = P2(1:L/2+1);
	P1(2:end-1) = 2*P1(2:end-1);
	fframe = enframe(P1,fix(length(P1)/33));                     % enframe in frequency domain,33 sub-bands in total
	[fn,fm] = size(fframe);
	for j = 1:fn
		 E(i,j) = sum(fframe(j,:).^2);                             % calcuate energy of each frame

	end
end

for n = 2:tn
	for m = 1:32
		if E(n,m)-E(n,m+1)-(E(n-1,m)-E(n-1,m+1))>0                 % calcuate the fingerprinter of audio
			F(n,m) = 1;
		else
			F(n,m) = 0;
		end
	end
end

end

