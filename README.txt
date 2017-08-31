Tracking results:

rmpe:      50.0     53.2         609  1142 765   2724       7594   3.6    45.5  
rmpe+:     50.0     52.8         609  1146 761   2723       7576   2.8    45.5 
posetrack: 51.4     61.4         653  1106 757   493        6080   18.6   55.3  
openpose:  46.1     56.5         578  1039 899   6577       5992   4.5    51.2 
openpose+: 46.1     56.1         578  1039 899   6573       6001   4.0    51.2

GT:        76.6     100.0        1618  590 308   4          1686   76.7   100.0
metrics = [recall+, precision+,  MT+,  PT, ML-, idswitches-, FRA-, MOTA+, MOTP+];
        
Paper results:

Rcll+ Prcn+ MT+ ML- IDs- FM- MOTA+ MOTP+
57.6 66.0 632 623 674 5080 27.2 56.1 
62.7 64.9 760 510 470 5557 28.2 55.8 
63.1 64.5 774 494 478 5564 27.8 55.7 
62.8 64.9 758 526 516 5458 28.2 55.8


Pose estimation results:

  			 &Head & Shoulder & Elbow & Wrist & Hip   & Knee  & Ankle & Total\\
rmpe:        46.8  & 54.3     & 37.6  & 30.6  & 31.8  & 28.2  & 21.0  & 35.8 \\
rmpe+:       46.7  & 54.0     & 37.4  & 30.5  & 31.7  & 28.0  & 20.9  & 35.6 \\
posetrack:   55.3  & 52.8     & 42.9  & 32.6  & 25.1  & 32.3  & 32.3  & 39.1 \\
openpose:    9.1   & 55.7     & 38.8  & 26.0  & 26.4  & 33.9  & 29.5  & 31.3 \\
openpose+:   9.0   & 55.3     & 38.5  & 25.8  & 26.2  & 33.6  & 29.3  & 31.1 


metrics = [recall, precision, Ngt, MT, PT, ML, idswitches, FRA, MOTA, MOTP];
        