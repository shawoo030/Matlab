%-----------------------lecture 3-----------------
% dicomread, zeros, figure (imagesc, colormap, axis, clim...) , print

clear all; close all; clc;

WorkingFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom';
PatientDataFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom\data\patient-example';
folders = dir(sprintf('%s\\', PatientDataFolder));  

for ff = 1:size(folders,1)
    if contains(folders(ff).name,'CT') % get CT folder from patient folder
            CTFolder = sprintf('%s\\%s', folders(ff).folder, folders(ff).name);
    end
end

% get DICOM files 
files = dir(sprintf('%s\\*.dcm', CTFolder));


% plotting the first CT slice
for fs = 1 %: size(files,1)
        filename = sprintf('%s\\%s', files(fs).folder, files(fs).name);
        info = dicominfo(filename);
        SliceLocation = info.SliceLocation;

        image = dicomread(info);
        
        
        % get header information to create coordinates
            % origin 가장 작은 좌표값 , spacing 픽셀 크기 또는 간격, size 픽셀 수, 이렇게 3가지가 필요
        image_origin = info.ImagePositionPatient; 
        image_spacing = info.PixelSpacing;
        image_size = size(image);
        
        
        % define coordinates in x,y directions
        x= zeros(image_size(1),1);
        y = zeros(image_size(2),1);
        
        for ii = 1:image_size(1)
            x(ii) = image_origin(1) + image_spacing(1)*(ii-1) ; % origin, 즉 처음 위치에서 spacing값인 0.977씩 이동을 하게 된다.
        end
        for jj = 1:image_size(2)
            y(jj) = image_origin(2) + image_spacing(2)*(jj-1);
        end
        
        
        figure('Color','w')      % 뒷 배경을 흰색으로 지정
        imagesc(x,y,image)      % image변수를 지정한 x,y 좌표에 plot하는 함수 / 이로서 index가 아닌 실제 좌표값이 그래프에 들어가게 됨
        colormap(gray);     % 원래 파란색 이미지에서 gray이미지로 바꿔짐
        
        axis equal      % 가로축과 세로축을 1:1로 동일하게
        axis tight        % 불필요한 여백 없애기S
        
        caxis([2500 4500])    % clim([cmin cmax]),  intensity 범위를 지정해 줌으로써 contrast를 향상시킬 수 있음
        xlabel('R-L distance (mm)', 'FontSize',20)
        ylabel('A-P distance(mm)', 'FontSize', 20)
        title('Axial View')
        
        fig_filename = sprintf('%s\\Lec3.jpg', WorkingFolder);
        print(fig_filename,'-djpeg','-r300')
     
end


%----------------------- 3. HW3 review-----------------------

        % find a file which slice location is -489.5 and save the image. 
        % When you plot the image, the range of x axis and y axis should be each -15~150 and -350~-50

clear all; close all; clc;


WorkingFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom';
PatientDataFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom\data\patient-example';

folders = dir(sprintf('%s\\', PatientDataFolder));  

for ff = 1:size(folders,1)
    if contains(folders(ff).name,'CT') % get CT folder from patient folder
            CTFolder = sprintf('%s\\%s', folders(ff).folder, folders(ff).name);
    end
end

% get DICOM files 
files = dir(sprintf('%s\\*.dcm', CTFolder));


for fs = 1: size(files,1)
       
        filename = sprintf('%s\\%s', files(fs).folder, files(fs).name);
        info = dicominfo(filename);
        SliceLocation = info.SliceLocation;
        RescaleSlop = info.RescaleSlope;
        RescaleIntercept = info.RescaleIntercept;
        
        if SliceLocation ==  -984.5

            fprintf("gotcha. Slice Loaction : %1f\n", SliceLocation )
            image_raw = dicomread(info);
            image2 = image_raw*RescaleSlop + RescaleIntercept;
            
            % get header information to create coordinates
            image_origin = info.ImagePositionPatient; 
            image_spacing = info.PixelSpacing;
            image_size = size(image2);

            % define coordinates in x,y directions
            x= zeros(image_size(1),1);
            y = zeros(image_size(2),1);

            for ii = 1:image_size(1)
                x(ii) = image_origin(1) + image_spacing(1)*(ii-1) ;
            end
            for jj = 1:image_size(2)
                y(jj) = image_origin(2) + image_spacing(2)*(jj-1);
            end


            figure('Color','w')      % 뒷 배경을 흰색으로 지정
            imagesc(x,y,image2)      % image변수를 지정한 x,y 좌표에 plot하는 함수 / 이로서 index가 아닌 실제 좌표값이 그래프에 들어가게 됨
            colormap(gray);     % 원래 파란색 이미지에서 gray이미지로 바꿔짐
         
            axis equal      % 가로축과 세로축을 1:1로 동일하게
            axis tight        % 불필요한 여백 없애기S
            axis([-150 150 -150 150])
            
            % contrast range 설정
            window = 250;
            level = 50;
            lower_limit = level - 0.5*window;
            upper_limit = level + 0.5*window;
            caxis([lower_limit upper_limit])    
            xlabel('R-L distance (mm)', 'FontSize',20)
            ylabel('A-P distance(mm)', 'FontSize', 20)
            title('Axial View')

            fig_filename = sprintf('%s\\HW3.jpg', WorkingFolder);
            print(fig_filename,'-djpeg','-r300')
        end
        
end


