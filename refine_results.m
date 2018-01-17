name = 'rmpe_results_hung.mat';
load(['/home/yuliang/code/PoseTrack-CVPR2017/data/bonn-multiperson-posetrack/results/exp3/',name]);
for vid=1:30
    for pid=1:annolist(vid).num_persons
        for fid=1:annolist(vid).num_frames
            if (fid~=1)&(fid<=annolist(vid).num_frames)&((class(annolist(vid).annopoints{pid, fid})=='double')&(class(annolist(vid).annopoints{pid, fid-1})~='double'))
                if (fid+1<=annolist(vid).num_frames)&class(annolist(vid).annopoints{pid,fid+1})== 'double'
                    if (fid+2<=annolist(vid).num_frames)&class(annolist(vid).annopoints{pid,fid+2})=='double'
                        if (fid+3<=annolist(vid).num_frames)&class(annolist(vid).annopoints{pid,fid+3})~='double'
                            annolist(vid).annopoints{pid,fid} = annolist(vid).annopoints{pid, fid+3};
                            annolist(vid).annopoints{pid,fid+1} = annolist(vid).annopoints{pid, fid+3};
                            annolist(vid).annopoints{pid,fid+2} = annolist(vid).annopoints{pid, fid+3};
                            for part_id=1:14
                                dis_x = annolist(vid).annopoints{pid, fid+3}.point(part_id).x - annolist(vid).annopoints{pid, fid-1}.point(part_id).x;
                                dis_y = annolist(vid).annopoints{pid, fid+3}.point(part_id).y - annolist(vid).annopoints{pid, fid-1}.point(part_id).y;
                                for i=1:3
                                    annolist(vid).annopoints{pid,fid-1+i}.point(part_id).x = annolist(vid).annopoints{pid, fid-1}.point(part_id).x+ i/4.0*(dis_x);
                                    annolist(vid).annopoints{pid,fid-1+i}.point(part_id).y = annolist(vid).annopoints{pid, fid-1}.point(part_id).y+ i/4.0*(dis_y);
                                end
                            end
                        end
                    elseif (fid+2<=annolist(vid).num_frames)
                        annolist(vid).annopoints{pid,fid} = annolist(vid).annopoints{pid, fid+2};
                        annolist(vid).annopoints{pid,fid+1} = annolist(vid)% name = 'test_annolist.mat';
% refine_name = 'test_annolist_refine.mat';
.annopoints{pid, fid+2};
                        
                        for part_id=1:14
                            dis_x = annolist(vid).annopoints{pid, fid+2}.point(part_id).x - annolist(vid).annopoints{pid, fid-1}.point(part_id).x;
                            dis_y = annolist(vid).annopoints{pid, fid+2}.point(part_id).y - annolist(vid).annopoints{pid, fid-1}.point(part_id).y;
                            for i=1:2
                                annolist(vid).annopoints{pid,fid-1+i}.point(part_id).x = annolist(vid).annopoints{pid, fid-1}.point(part_id).x+ i/3.0*(dis_x);
                                annolist(vid).annopoints{pid,fid-1+i}.point(part_id).y = annolist(vid).annopoints{pid, fid-1}.point(part_id).y+ i/3.0*(dis_y);
                            end
                        end
                    end
                elseif (fid+1<=annolist(vid).num_frames)
                    annolist(vid).annopoints{pid,fid} = annolist(vid).annopoints{pid, fid+1};
                    
                    for part_id=1:14
                        annolist(vid).annopoints{pid,fid}.point(part_id).x = 1.0/2.0*annolist(vid).annopoints{pid, fid-1}.point(part_id).x+ 1.0/2.0*annolist(vid).annopoints{pid, fid+1}.point(part_id).x;
                        annolist(vid).annopoints{pid,fid}.point(part_id).y = 1.0/2.0*annolist(vid).annopoints{pid, fid-1}.point(part_id).y+ 1.0/2.0*annolist(vid).annopoints{pid, fid+1}.point(part_id).y;
                    end
                end
            end
        end
    end
end

save(['/home/yuliang/code/PoseTrack-CVPR2017/data/bonn-multiperson-posetrack/results/exp3/',name], 'annolist');
