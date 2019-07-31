# AudioProcessing
An toolbox for audio processing in Matlab,the verison of Matlab is R2016a. </br>
The audio sample in this toobox is 8000Hz, 16 bits.

## 1. getAudioFingerpriner
+ [getAudioFingerprinter](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getAudioFingerprinter.m) calcuates the difference of the energy of each frequency sub-band as shown below.  
![Extraction process](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/audiofingerprinter.jpg)

+ Specifically, the extraction process including the following steps:
1. divide audio into frames, the overlap length is alterable
2. do fft for each frame 
3. divide frequency spectrum into 32 frequency sub bands
4. calcuate the energy of each sub band
5. calcuate audio fingerprinter as follow  
![Bit Derviation](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/bitDerivation.JPG)

+ The result is shown below
![printer](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/fingerprinter.png)

## 2. getZCR
+ [getZCR](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getZCR.m) calcuates the zero-crossing rate which can be used to predict the frequency roughly.  
+ Specifically, the extraction process including the following steps:
1. divide audio into frames 
2. calcuate zcr of each frame using the following equation  
![ZCR](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/ZCR.JPG)                      
where sgn(x) is given by  
![sgn(x)](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/sgn.JPG)  

+ The result is shown below  
![zcrpic](https://github.com/DandelionLau/AudioProcessing/blob/master/pic/ZeroCrossingRate.png)  

## 3. getLandmarks
+ [getLandmarks](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getLandmarks.m) calcuates the max-enegry points(also called landmark) in the frequency spectrum.  

+ Specifically, the extraction process including the following steps:  
1. divide audio into frames, the overlap length is alterable
2. do fft for each frame 
3. calcuate the energy of frequency 
4. calcuate the local maximum as landmark
+ The result is shown below  
![landmark-2d](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/pic/landmark-2d.png)
![landmark-3d](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/pic/landmark-3d.png)

## 4. getEnergy
+ [getEnergy](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getEnergy.m) calcuates the short-time energy.  
+ Specifically, the extraction process including the following steps:    
1.divide audio into frames, the overlap length is alterable  
2.calcuate the energy using the following equation:  
![stenergy](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/pic/short-time-energy.png)

+ The result is shown below  
![getEnrgy](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/pic/getEnergy.png)

## 5. getSpecgram
+ [getSpecgram](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getSpecgram.m) calcuates the spectgram.
+ Specifically, the extraction process including the following steps:    
1. divide signal into frames in time domain  
2. do fft of each frame  
+ The result is shown below  
![specgram](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/pic/specgram.png)

## 6. getLMSPredictor
+ [getLMSPredictor](https://github.com/DandelionLau/AudioProcessing-toolbox/blob/master/getLMSPredictor.m) trains least mean square(LMS) adaptive predictor.
