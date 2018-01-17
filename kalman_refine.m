name = 'rmpe_results_hung_noblank_newmsrcnn2.mat';
refine_name = 'rmpe_results_hung_noblank_newmsrcnn2_kalman.mat';

% name = 'test_annolist.mat';
% refine_name = 'test_annolist_refine.mat';

load(['/home/yuliang/code/PoseTrack-CVPR2017/data/bonn-multiperson-posetrack/results/exp3/',name]);

 stateModel = [1 0;0 1]; 
 measurementModel = [1 0];
%  p_noise = 20;
%  m_noise = 3;
%  thres = 0.6;
 num = 0;
       
for vid=1:30
    for pid=1:annolist(vid).num_persons
        kalmans = cell(1,28);
        point_cube = [];
        in_tracker = false;
        for fid=1:annolist(vid).num_frames
            if isequal(annolist(vid).annopoints{pid,fid},[]) == false && in_tracker == false
                in_tracker = true;
                for part_id=1:14
                    kalmans{1,part_id} = vision.KalmanFilter(stateModel,measurementModel,'ProcessNoise',p_noise,'MeasurementNoise',m_noise);
                    location = annolist(vid).annopoints{pid,fid}.point(part_id).x;
                    kalmans{1,part_id}.State = [location, 0]; 
                end
                for part_id=15:28
                    kalmans{1,part_id} = vision.KalmanFilter(stateModel,measurementModel,'ProcessNoise',p_noise,'MeasurementNoise',m_noise);
                    location = annolist(vid).annopoints{pid,fid}.point(part_id-14).y;
                    kalmans{1,part_id}.State = [location, 0]; 
                end
            elseif isequal(annolist(vid).annopoints{pid,fid},[]) == false
                for part_id=1:14
                    location = annolist(vid).annopoints{pid,fid}.point(part_id).x;
                    trackedLocation = correct(kalmans{1,part_id},location);
                    if annolist(vid).annopoints{pid,fid}.point(part_id).score<thres
                        annolist(vid).annopoints{pid,fid}.point(part_id).x = trackedLocation;
                        num = num +1;
                    end
                end
                for part_id=15:28
                    location = annolist(vid).annopoints{pid,fid}.point(part_id-14).y;
                    trackedLocation = correct(kalmans{1,part_id},location);
                    if annolist(vid).annopoints{pid,fid}.point(part_id-14).score<thres
                        annolist(vid).annopoints{pid,fid}.point(part_id-14).y = trackedLocation;
                        num = num + 1;
                    end
                end
            elseif isequal(annolist(vid).annopoints{pid,fid},[]) && fid<annolist(vid).num_frames
                if ~isequal(annolist(vid).annopoints{pid,fid+1},[])
                    continue;
                else
                    break;
                end
            end
%             elseif fid<=annolist(vid).num_frames-1 && isequal(annolist(vid).annopoints{pid,fid},[]) == true && in_tracker
%                 front_noblank = ~isequal(annolist(vid).annopoints{pid,fid-1},[]);
%                 end_noblank = ~isequal(annolist(vid).annopoints{pid,fid+1},[]);
%                 if end_noblank == false
%                     break;
%                 elseif front_noblank
%                     annolist(vid).annopoints{pid,fid} = annolist(vid).annopoints{pid,fid+1};
%                     [vid,fid,pid];
%                 end
%             end
        end
    end
end
save(['/home/yuliang/code/PoseTrack-CVPR2017/data/bonn-multiperson-posetrack/results/exp3/',refine_name], 'annolist');
