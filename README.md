# Speaker Recognition experiment with MATLAB
The project's objective was the creation and test of a speaker identification methodology based on the audio parameters of a speaker's voice. It was a semester project for Audio & Video Technologies course during my Master's Studies 
at International Hellenic University.

The team of the project consisted of 3 male speakers that made clear voice recordings and then we used MATLAB code to extract the audio parameters for each of those recordings using 
[MIR Toolbox](https://www.mathworks.com/matlabcentral/fileexchange/24583-mirtoolbox), an open source MATLAB toolbox dedicated to the extraction of different musical features from audio files. The method we will use was text-independent,
meaning that the words we used when recording the files where not from a specific dictionary. The recordings were made in Modern Greek language.
Then, we organised those extracted features in graphs in order to visualize if any of those parameters is useful or not in order to create a simple speaker recognition system.

## What is Speaker Recognition?
Speaker recognition is the ability to automatically detect a speaker among others, by using information found in his speech waves. There are four categories in which the spectrum of methods of speech recognition can be divised:
- **Speaker Identification**
- **Speaker Verification**
- **Speaker Diarization**
- **Speaker De-Identification**

<p align = "center">
  <img width="685" height="390" alt="image" src="https://github.com/user-attachments/assets/87cca074-04d7-4a4e-a16c-e6179474f838" />
</p>

In our day and age, speaker recognition systems can be found everywhere, from smartphones and tablets to smart vehicle systems. Google's Gemini, Amazon's Alexa and Apple's Siri use speaker recognition systems to identify each user's voice.

## Speaker Identification Process
Speaker identification is the ability of a system to specify a certain ID to a person based on his speech. This can be achieved by retrieving a certain amount of this person's voice saved data. The system is supposed to answer to the question "Who is the one talking?"
In the image below, there is a step - to - step visualization of this process.
<p align = "center">
  <img width="1310" height="446" alt="image" src="https://github.com/user-attachments/assets/63cd6648-7115-4815-b192-f894e7c1037e" />
</p>

The first part of the process is taking samples from the voices of all speakers, and after digitization of these samples (using ADC), we perform the _feature extraction_ process. For the process to take
action, the samples need to be _framed_, which means separation of each sample in smaller portions (500mS, 1s or 2s each). This process will end with the creation of **speaker models**, which will then
be stored in a database for future use. By building these models, the system is being "trained" in order to identify the specific sound patterns for each speaker. During testing procedure, the system performs a **pattern matching**, in order to identify the speaker based on the stored data of his voice.

This method is vastly used in speaker recognition system, due to its high percent of success, although it is quite cost inefficient, due to the physical storage space needed for storing the database.

## Speaker Verification Process
Speaker verification is a process of accepting or denying the claimed identity of a speaker. This can be expressed via the question "Is this X that is talking?". In order for these types of systems to perform the verification process is the existence of a database, similar to the one used in the identification process. As we can see in the image below, there are 2 different stages for this process,
the first one being almost identical to the speaker identification systems.

<p align = "center">
  <img width="1308" height="586" alt="image" src="https://github.com/user-attachments/assets/1b58363c-7108-441a-b64c-daf62d728fa3" />
</p>

The difference between an identification and a verification system is on the second stage of the process. When a speaker claims his ID, the system must decide if the claimed ID is real or not. The system performs a comparison between the unknown person's voice and the model stored in the database concerning that claimed ID. Then, a **Score Ratio** is calculated in order to accept or reject the claimed ID. The acceptance or rejection is defined by a _threshold_ that is compared to the score ratio.

With the use of this method, it is statistically impossible for a system to fail in identifying a specific speaker, thus it is mostly used in modern applications.

## Speaker Diarization Process
Speaker diarizataion is a method that is used in multiparticipant environments. It responds to the question "Who talks when?". The process is being performed in 6 different steps, according to the figure below.

<p align = "center">
  <img width="1434" height="153" alt="image" src="https://github.com/user-attachments/assets/0d2c4c25-c949-4016-a484-cec57d9af2e2" />
</p> 

The audio input (e.g. a multi-speaker audio file) must be first of all normalized and dereverberated. This is performed in _Front-End Processing_ step. Then, the system performs _Speech Activity Detection_ to separate the parts of the file that contain speech. This process is performed by the use of a bandpass filter. The third stage of the process is called _Segmentation_ and its purpose is to create smaller fragments of the audio file in order to study the sound parameters efficiently. A few years ago, segmentation was speker-change point oriented, meaning that segments were separated every time there was a change of speaker. That method was rather complex and inefficient, so modern diarization systems use uniform segmentation of certain length. The fourth stage of the process is labeled _Speaker Embedding_ and its purpose is to measure similarities between segments. This is performed via algorithms like [Joint Factor Analysis](https://www.scribd.com/document/302799742/FAtheory-2)(JFA) and neural networks. On the fifth stage of the process labeled _Clustering_ segments with most similarities are grouped together. Each cluster will statistically contain each individual speaker's voice. Algorithms used for this stage are Machine Learning methods such as [k-means](https://www.thecoderschool.com/blog/advanced-machine-learning-techniques-k-means-clustering-algorithm/), [Agglomerative Hierarchical Clustering](https://www.scribd.com/presentation/464352870/Hierarchical-Clustering) (AHC) and Spectral Clustering. Last but not least, is the _Post-Processing_ stage, in which the system performs a resegmentation of the input signal, this time oriented by the time each individual speaker's voice is recognized.

Interesting fact about speaker diarization method is that opposing the other two methods, there is no database model for each individual speaker, therefore the system uses logic programming instead of sequential. 

## Speaker De-Identification
Speaker De-Identification is a process used to alter the sound of a speaker's voice in order to retain his anonymity. In order to achieve this, de-identification methods use voice transformation of the input signal. Then, the system uses a "target speaker" and performs the transformation so as the voice of the source speaker sound like its from the target speaker. Reason for using this method is due to European Union's GDPR (General Data Protection Regulation) of 2016. 

## Our Experimental Approach
As previously mentioned, our research team consisted of 3 male speakers of about the same age. This means that their vocal frequencies are quite the same, therefore it would be quite challenging to distinguish each one's voice. 

### Recording Voice Files
First of all, we will record some audio files to use as samples of the 3 voices. Those recordings are the following:
- Each individual speaker's voice when speaking alone
- 3 speaker duets in pairs (Speaker A & B, Speaker B & C, Speaker A & C)
- All 3 speakers talking simultaneously
Each audio file is 5 minutes long, in order for our system to utilize plenty of sample material. All recordings took place in a studio environment, in order for the audio files to be as clean as possible. The files were .WAV (thus uncompressed), in order for all the spectral information of the recording to be used for analysis.

### Processing Voice Files
Processing of our files is performed with the use of MATLAB and more specifically via the MIR Toolbox, as we mentioned before. Then, we need to select the most useful sound parameters in order to recognize its speaker's different voice. The parameters we select should fulfill the following requirements:
- Large between-speaker variability and small within-speaker variability
- Noise and distortion tollerant
- "Physic" common appearance in speaker's voice
- Easily measured in sound signal
- Hard to mimic
- Unaffected by speaker's health (e.g. due to seasonal hoarseness) or long-term voice changes (e.g. voice-cracks of puberty)

### Audio Parameters Used in the experiment

#### Time Characteristics
- **RMS Energy**: running average of signal energy, as opposed to peak level, which is the highest instantaneous value.
- **Zero - Crossing Rate**: rate at which an audio signal changes its algebraic sign (from positive to negative or negative to positive) across the zero-amplitude line.
- **Shannon Entropy**: mathematical measure of the uncertainty, randomness, or complexity of an audio signal's data distribution.

#### Frequency Characteristics
- **Rolloff Frequency**: rate at which a signal's level decreases after passing through a filter or the passband frequency.
- **Spectral Brightness**: audio attribute that describes the balance of low-frequency and high-frequency energy in a sound
- **Spectral Irregularity**: feature that measures how much the amplitudes of adjacent harmonics (or frequency bands) vary or jump up and down relative to one another.
- **Spectrum Centroid**: indicates where the "center of mass" of the spectrum of the sound is located. 
- **Spectral Spread**: measures how the energy of a sound is distributed around its spectrum centroid.
- **Spectral Skewness**: audio descriptor that measures the symmetry of an audio frequency spectrum around its spectrum centroid.
- **Spectral Kurtosis**: feature that measures the "peakedness," sharpness, or non-Gaussian distribution of a power spectrum around its spectral centroid.
- **Spectral Flatness**: audio feature that measures how "noise-like" or "tone-like" a sound is.

#### Cepstral Characteristics
- **Mel Frequency Cepstral Coefficients (MFCC)**: a set of numerical features that represent the short-term power spectrum and timbre (tone quality) of an audio signal, designed to mimic how the human ear perceives sound.
