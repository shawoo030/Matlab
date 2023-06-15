%%%%%%%%%%%%%%lec 4%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------1. raw value to CT number-------------------
%       CT number = RescaleSclope x (raw value) + RescaleInterupt


% -----------------2. Window width / window level-------------------
%        Lower limit = Level - (1/2)* Window , Upper limit = Level + (1/2)*Window
%       clim() or caxis()로 범위 설정 가능. 대조도를 높이기 위해서는 window width를 낮춰야 한다.


%---------------------- 3. CT volume으로 읽기 -----------------------------
        % dicomreadVolume()
        % squeeze () : dicomereadVolume()으로 이미지를 받으면 4D로 얻어지게 됨. 불필요한 volume을 줄여줄 수 있음

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


% load image volume
[image, spatial] = dicomreadVolume(CTFolder);
image = squeeze(image);

% get origin spacing size
image_origin = spatial.PatientPositions(1,:);
image_spacing = spatial.PixelSpacings(1,:);
image_spacing(3) = spatial.PatientPositions(2,3) - spatial.PatientPositions(1,3); % z축좌표를 얻고 싶을 때
image_size = size(image); % or image_size = spatial.ImgaeSize



%---------------------- 4. HW4 review -----------------------------

% define coordinates in x, y, z directions
x = zeros(image_size(1),1);
y = zeros(image_size(2),1);
z = zeros(image_size(3),1);

for ii = 1:image_size(1)
    x(ii,1) = image_origin(1) + image_spacing(1)*(ii-1);
end
for jj = 1:image_size(2)
    y(jj,1) = image_origin(2) + image_spacing(2)*(jj-1);
end
for kk = 1:image_size(3)
    y(kk,1) = image_origin(3) + image_spacing(3)*(kk-1);
end

Axis = ['x';'y';'z'];
Min = [min(x); min(y); min(z)];
Max = [max(x);max(y);max(z)];
T = table(Axis, Min, Max);
writetable(T,'AxisRange.txt');
type AxisRange.txt

% or
C = {'x',min(x),max(x), ;'y',min(y),max(y),;'z', min(z),max(z)};

fileID = fopen('AxisRange.txt2','w');
formatSpec = '%s %2.1f %2.1f \n';
[nrows,ncols] = size(C);
for row = 1:nrows
    fprintf(fileID,formatSpec,C{row,:});
end
fclose(fileID);

type AxisRange.txt2
