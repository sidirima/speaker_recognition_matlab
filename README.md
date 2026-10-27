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
 <img width="796" height="86" alt="image" src="https://github.com/user-attachments/assets/4a5e2489-873e-448a-8575-a72cac439cf3" />
</p>

The difference between an identification and a verification system is on the second stage of the process. When a speaker claims his ID, the system must decide if the claimed ID is real or not. The system performs a comparison between the unknown person's voice and the model stored in the database concerning that claimed ID. Then, a **Score Ratio** is calculated in order to accept or reject the claimed ID. The acceptance or rejection is defined by a _threshold_ that is compared to the score ratio.

With the use of this method, it is statistically impossible for a system to fail in identifying a specific speaker, thus it is mostly used in modern applications.

## Speaker Diarization Process
Speaker diarizataion is a method that is used in multiparticipant environments. It responds to the question "Who talks when?". The process is being performed in 6 different steps, according to the figure below.

<p align = "center">
  <img width="1434" height="195" alt="image" src="https://github.com/user-attachments/assets/043e5c20-7ab9-4d67-bb82-5b095b7bd2dc" />
</p> 
The audio input (e.g. a multi-speaker audio file) must be first of all normalized and dereverberated. Then, the system performs _Speech Activity Detection_ to separate the parts of the file that contain speech. This process is performed by the use of a bandpass filter.
