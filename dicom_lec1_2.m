%------------------lec1-------------------
% dicominfo, fprintf, fopen

clear all; close all; clc;

filename='./data/OISC/train1/1.dcm';
info = dicominfo(filename);

% get information from DICOM CT file
PixelSpacing = info.PixelSpacing;
PatientName = info.PatientName;
PatientFamilyName = PatientName.FamilyName;
Width = info.Width;

% print out CT information
% 1. to the command window
fprintf('Train1, 1.dcm\n')
fprintf('Pixel Spacing: %.3f, %.3f\n', PixelSpacing)
fprintf('Patient Name : %s \n', PatientFamilyName)
fprintf('Width : %d \n', Width)

% 2. to a text file
fid = fopen('./data/OISC/train1/1.txt','w');
fprintf(fid,'Pixel Spacing: %.3f, %.3f\n', PixelSpacing);
fprintf(fid,'Patient Name : %s \n', PatientFamilyName);
fprintf(fid,'Width : %d \n', Width);

fclose(fid);


%-------------lec 2------------------------
% dir, sprintf, for/if statement, size, contains

clear all; close all; clc;

WorkingFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom';
PatientDataFolder = 'C:\Users\cbs1009\Desktop\Chaerim\matlab\dicom\data\patient-example';

% get CT folder from patient folder
folders = dir(sprintf('%s\\', PatientDataFolder));  % \\이면 출력할 때는 마지막에 \하나만 추가됨.

for ff = 1:size(folders,1)
    if contains(folders(ff).name,'CT')
            CTFolder = sprintf('%s\\%s', folders(ff).folder, folders(ff).name);
    end
    
end


% get DICOM files 
files = dir(sprintf('%s\\*.dcm', CTFolder));

for fs = 1: size(files,1)
        filename = sprintf('%s\\%s', files(fs).folder, files(fs).name);
        info = dicominfo(filename);
        SliceLocation = info.SliceLocation;
        
        fprintf('Slice location = %.1f\n', SliceLocation) % superior냐 imperial 이냐에 대한 정보.
end


