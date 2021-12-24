%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% getSubFiles.m
%
% Beam.Aschakulporn@otago.ac.nz
% https://pbeama.github.io/
% Modified: Friday 24 December 2021 (19:13)
% * Comments removed.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function D = getSubFiles(varargin)

PATH = cd;
if nargin == 1
PATH = varargin{1};
end

if PATH(end) ~= filesep
PATH(end + 1) = filesep;
end

LIST = getDirs(PATH);

nLIST = length(LIST);
D = [];

for i = 1 : nLIST
dDir = dir(LIST{i});
dDir(1 : 2) = [];
D = [D; dDir];
end

end

function LIST = getDirs(PATH, varargin)
LIST = [];
if nargin == 2
LIST = varargin{1};
end
D = dir(PATH);
D(1 : 2) = [];
if PATH(end) ~= filesep
PATH(end + 1) = filesep;
end

FOLDERS = D([D.isdir]);
nFOLDERS = length(FOLDERS);

for ithFOLDER = 1 : nFOLDERS
subPATH = [PATH, FOLDERS(ithFOLDER).name];
LIST = [LIST; {subPATH}];

LIST = getDirs(subPATH, LIST);

end

end
