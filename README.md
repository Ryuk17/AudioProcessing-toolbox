# AudioProcessing
An toolbox for audio processing in Matlab,the verison of Matlab is R2016a

## extractAudioFingerpriner
extract audio fingerprinter by calcuating the difference of the energy of each frequency sub-band 
![Extraction process](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/audiofingerprinter.jpg)

1. divide audio into frames, the overlap length is alterable
2. do fft for each frame 
3. divide frequency spectrum into 32 frequency sub bands
4. calcuate the energy of each sub band
5. calcuate audio fingerprinter as follow</br>
![Bit Derviation](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/bitDerivation.JPG)

## getZCR
calcuate the zero-crossing which can be used to predict the frequency roughly
