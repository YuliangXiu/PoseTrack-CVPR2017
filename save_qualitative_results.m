function save_qualitative_results(expidx, startidx, nvids, options)


if(nargin < 4)
    options.minTrackLen = 6;
    options.minAvgJoints = 5;
end

colors = {'r','g','b','c','m','y'};
person_colors = hsv(10);
markerSize = 6;
lineWidth = 4;
edges = [1 2; 2 3; 3 13; 4 13; 4 5; 5 6; 7 8; 8 9; 10 11; 11 12; 9 13; 10 13; 13 14];

p = pt_exp_params(expidx);
exp_dir = fullfile(p.expDir, p.shortName);
load(p.trainGT,'annolist');
save_dir = [exp_dir, '/qualitative_results/'];
mkdir_if_missing(save_dir);
save_dir = [save_dir, sprintf('/exp_%03d', expidx)];
mkdir_if_missing(save_dir);

for vIdx = startidx:startidx+nvids


    fprintf('vididx: %d\n',vIdx);
    ann = annolist(vIdx);
    vid_name    = ann.name;
    vid_dir     = fullfile(p.vidDir, vid_name);
    num_frames  = ann.num_frames;
    fn          = dir([vid_dir,'/*.jpg']);

    save_dir_vid = fullfile(save_dir, vid_name);
    mkdir_if_missing(save_dir_vid);
    
    load([p.ptMulticutDir '/prediction_' num2str(expidx) '_' vid_name], 'people');

    numPeople = size(people,1);
    fprintf('Num People = %d\n', numPeople);
    corrIdxs = zeros(1,numPeople);
    for pIdx=1:size(people,1)
        len = sum(~cellfun(@isempty,people(pIdx,:)));
        if(len > options.minTrackLen)
            corrIdxs(pIdx) = 1;
        end
    end

    people = people(logical(corrIdxs), :);
    numPeople = size(people,1);
    corrIdxs = zeros(1,numPeople);
    for pIdx=1:size(people,1)
        nj = 0;
        nf = 0;
        for fIdx=1:size(people,2)
            joints = people{pIdx,fIdx};
            if(isempty(joints))
                continue;
            end
            num = sum(~isnan(joints(:)))/2;
            nj = nj + num;
            nf = nf + 1;
        end
        avg = nj / nf;
        if(avg > options.minAvgJoints)
            corrIdxs(pIdx) = 1;
        else
            fprintf('%d not deleted\n', pIdx);
        end
    end

    people = people(logical(corrIdxs), :);
    fprintf('Num People after Pruning = %d\n', size(people,1));

    % for ffIdx = 1:min(num_frames,size(people,2))
    for ffIdx = 1:min(num_frames)

        for fIdx=ffIdx:ffIdx
            fprintf('Frame: %d/%d\n',fIdx, num_frames);
            fr_fn = fullfile(vid_dir, fn(fIdx).name);
            img = imread(fr_fn);

            figure(1001); clf; 
            set(gcf, 'color', 'k');
            set(gca, 'color', 'k');
            imshow(img); hold on;

            for j = 1:size(people,1)
                person = people{j, fIdx};        
                
                if(expidx == 103)
                    pid = randi([1,6]);
                    person_color = [person_colors(mod(pid-1,size(person_colors,1))+1,:)];
                else
                    person_color = [person_colors(mod(j-1,size(person_colors,1))+1,:)];
                end

                if(isempty(person))
                    continue;
                end

                for i = 1:size(edges,1)
                    pos1 = person(edges(i,1), :);
                    pos2 = person(edges(i,2), :);
                    if (~isnan(pos1(1)) && ~isnan(pos2(1)))
                        plot([pos1(1);pos2(1)],[pos1(2);pos2(2)],'-', 'Color', person_color ,'linewidth',lineWidth);
                    end
                end

                for i = 1:size(person, 1)
                    if isnan(person(i, 1))
                        continue;
                    end
                    pos = person(i, :);
                    cp = colors{mod(i-1,length(colors))+1};
                    plot(pos(:,1),pos(:,2),[cp 'o'],'MarkerSize',markerSize,'MarkerFaceColor',person_color,'MarkerEdgeColor',cp, 'LineWidth', 1.5);
                end
            end
            fname = [save_dir_vid, sprintf('/%05d.png', fIdx)];
%             print(gcf, '-dpng', [fname '.png']);
            F = getframe;
            F = imresize(F.cdata, [size(img,1), size(img,2)]);
            imwrite(F, fname);
    %         comb = [comb, F];
%             figure(4), imshow(F);
%             pause();
        end
        pause(0.001);
    end
end
