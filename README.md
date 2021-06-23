# Digital_guitar_tuner
#When the program starts, the string number has to be selected which are
numbered from 1 to 6.
#The fundamental frequency of each string is given and stored in an array
#The approximate error frequency is defined as 30Hz.
The computer records the audio signal provided by the user for 2.5 seconds and
stores it.
The input audio signal is processed and Frequency response
In the code we found the fundamental frequency of input signal which is
described in the technical specification.
This is done by using hamming window and then down sampling the obtained
signal. After downsampling we added all the down sampled signals. Then the
comparision takes place.
Based on the string number selected the fundamental frequency of the particular
string number is compared with input signal fundamental frequency Fin. 
If the absolute value of the difference between input fundamental frequency and user
defined fundamental frequency is less than 30, The output will be Perfect tuning.
If difference is greater than 30, depending on the sign of the difference the output
displays either to increase or decrease the input signal frequency.
