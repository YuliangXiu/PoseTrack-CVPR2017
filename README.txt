Tracking results:

rmpe:      50.0     53.2         609  1142 765   1154       7588   5.0    45.4 
           49.7 &   53.4 &  &    603 &1132 781 & 1025 &   7624 &   5.4 &  45.5 &
rmpe+:      
posetrack: 51.4     61.4         653  1106 757   493        6080   18.6   55.3  
openpose:  48.8     59.1         615  1083 818   5275       6413   10.2   50.8 
openpose+: 48.0 &   59.0 &     & 590  1091 835 & 7743 &     6795 &  7.5 & 50.9 &
           45.4 &   58.8 &     & 519 &1123 874 & 4942 &     6969 &  9.1 & 51.0 & 
           45.9 &   58.8 &     & 536 &1109 871 & 5415 &     6902 &  8.8 & 50.9 &

GT:        76.6     100.0        1618  590 308   4          1686   76.7   100.0
metrics = [recall+, precision+,  MT+,  PT, ML-, idswitches-, FRA-, MOTA+, MOTP+];
        
Paper results:

Rcll+ Prcn+ MT+ ML- IDs- FM- MOTA+ MOTP+
57.6 66.0 632 623 674 5080 27.2 56.1 
62.7 64.9 760 510 470 5557 28.2 55.8 
63.1 64.5 774 494 478 5564 27.8 55.7 *
62.8 64.9 758 526 516 5458 28.2 55.8


Pose estimation results:

  			 &Head & Shoulder & Elbow & Wrist & Hip   & Knee  & Ankle & Total\\
rmpe:        46.8  & 54.3     & 37.6  & 30.6  & 31.8  & 28.2  & 21.0  & 35.8 \\
rmpe+:       46.7  & 54.0     & 37.4  & 30.5  & 31.7  & 28.0  & 20.9  & 35.6 \\
posetrack:   55.3  & 52.8     & 42.9  & 32.6  & 25.1  & 32.3  & 32.3  & 39.1 \\
openpose:    14.5  & 56.8     & 39.6  & 26.6  & 27.0  & 34.7  & 29.9  & 32.7 \\
openpose+:   9.0   & 55.3     & 38.5  & 25.8  & 26.2  & 33.6  & 29.3  & 31.1 


Ours
56.5 51.6 42.3 31.4 22.0 31.9 31.6 38.2
BBox-Detection [34] + LJPA [17]
50.5 49.3 38.3 33.0 21.7 29.6 29.2 35.9
+ CPM [40]
48.8 47.5 35.8 29.2 20.7 27.1 22.4 33.1
DeeperCut [16]
56.2 52.4 40.1 30.0 22.8 30.5 30.8 37.5


metrics = [recall, precision, Ngt, MT, PT, ML, idswitches, FRA, MOTA, MOTP];
        


Ours
63.0 64.8 775 502 431 5629 28.2 55.7


BBox-Tracking [38, 34] + LJPA [17]
58.8 64.8 716 646 319 5026 26.6 53.5
+ CPM [40]
60.1 57.7 754 611 347 4969 15.6 53.4



1-5    57.4 &  58.8 & 277 &  82 & 147 &  48 &  165 & 1305 &  16.7 &   57.8 & 
6-10   49.1 &  63.8 & 364 &  79 & 146 & 139 &   39 &  720 &  20.9 &   51.7 & 
11-15  68.1 &  69.4 & 343 & 139 & 160 &  44 &   77 &  748 &  37.4 &   56.8 & 
16-20  44.0 &  58.8 & 457 & 103 & 177 & 177 &   21 &  765 &  13.0 &   53.9 & 
21-25  47.4 &  59.4 & 530 & 118 & 268 & 144 &   81 & 1377 &  14.6 &   52.6 & 
26-30  44.6 &  62.6 & 545 & 132 & 208 & 205 &  110 & 1165 &  17.4 &   55.8 & 

paper  63.1    64.5         774   494   478          5564    27.8     55.7 *
my     51.4    61.4         653  1106   757          6080    18.6     55.3  



35	35x151 cell
5	5x60 cell
20	20x101 cell
7	7x100 cell
20	20x117 cell
4	4x61 cell
13	13x41 cell
11	11x41 cell
7	7x41 cell
8	8x41 cell
6	6x41 cell
2	2x41 cell
6	6x41 cell
37	37x41 cell
12	12x41 cell
9	9x41 cell
4	4x41 cell
42	42x41 cell
11	11x41 cell
24	24x41 cell
9	9x41 cell
6	6x41 cell
5	5x41 cell
25	25x41 cell
44	44x41 cell
33	33x41 cell
25	25x41 cell
22	22x41 cell
14	14x41 cell
11	11x33 cell

4	4x151 cell
3	3x60 cell
6	6x101 cell
2	2x100 cell
5	5x117 cell
3	3x61 cell
7	7x41 cell
8	8x41 cell
3	3x41 cell
5	5x41 cell
3	3x41 cell
2	2x41 cell
4	4x41 cell
10	10x41 cell
6	6x41 cell
5	5x41 cell
2	2x41 cell
13	13x41 cell
4	4x41 cell
10	10x41 cell
4	4x41 cell
3	3x41 cell
4	4x41 cell
11	11x41 cell
16	16x41 cell
14	14x41 cell
8	8x41 cell
8	8x41 cell
5	5x41 cell
5	5x33 cell