%% Demo: 
%  PoseTrack: Joint Multi-Person Pose Estimation and Tracking
%  Umar Iqbal, Anton Milan and Juergen Gall
%  CVPR 2017. 

% Index of the video. Use any value between 1-30
start_index = 3;

% Number of videos to process starting from the index 'start_index'
num_videos = 1;

% extract heatmaps for the video
% pt_cache_cnn_features(3, 'train', start_index, num_videos, false);
% 
% % extract correspondences
% pt_cache_deepmatching_features(3, 'train', start_index, num_videos);

% pose tracking
pt_pose_tracking(3, start_index, num_videos, false, false);

% pt_eval_pose_tracking(3);
% pt_evaluateAP(3);
% pt_eval_pose_tracking_rmpe(3);
% pt_evaluateAP_rmpe(3);
% pt_eval_pose_tracking_cmu(3);
% pt_evaluateAP_cmu(3);