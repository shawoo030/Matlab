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
            % origin ���� ���� ��ǥ�� , spacing �ȼ� ũ�� �Ǵ� ����, size �ȼ� ��, �̷��� 3������ �ʿ�
        image_origin = info.ImagePositionPatient; 
        image_spacing = info.PixelSpacing;
        image_size = size(image);
        
        
        % define coordinates in x,y directions
        x= zeros(image_size(1),1);
        y = zeros(image_size(2),1);
        
        for ii = 1:image_size(1)
            x(ii) = image_origin(1) + image_spacing(1)*(ii-1) ; % origin, �� ó�� ��ġ���� spacing���� 0.977�� �̵��� �ϰ� �ȴ�.
        end
        for jj = 1:image_size(2)
            y(jj) = image_origin(2) + image_spacing(2)*(jj-1);
        end
        
        
        figure('Color','w')      % �� ����� ������� ����
        imagesc(x,y,image)      % image������ ������ x,y ��ǥ�� plot�ϴ� �Լ� / �̷μ� index�� �ƴ� ���� ��ǥ���� �׷����� ���� ��
        colormap(gray);     % ���� �Ķ��� �̹������� gray�̹����� �ٲ���
        
        axis equal      % ������� �������� 1:1�� �����ϰ�
        axis tight        % ���ʿ��� ���� ���ֱ�S
        
        caxis([2500 4500])    % clim([cmin cmax]),  intensity ������ ������ �����ν� contrast�� ����ų �� ����
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


            figure('Color','w')      % �� ����� ������� ����
            imagesc(x,y,image2)      % image������ ������ x,y ��ǥ�� plot�ϴ� �Լ� / �̷μ� index�� �ƴ� ���� ��ǥ���� �׷����� ���� ��
            colormap(gray);     % ���� �Ķ��� �̹������� gray�̹����� �ٲ���
         
            axis equal      % ������� �������� 1:1�� �����ϰ�
            axis tight        % ���ʿ��� ���� ���ֱ�S
            axis([-150 150 -150 150])
            
            % contrast range ����
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


